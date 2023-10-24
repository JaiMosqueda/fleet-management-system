import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Api {

  Api.privateConstructor();

  static final Api instance = Api.privateConstructor();

  Future login(Map credentials) async {
    var url = Uri.parse("${dotenv.env['API_URL']}/login");

    var response = await http.post(url, body: convert.jsonEncode(credentials),
        headers: {"Content-type": "application/json"});
    if(response.statusCode != 200) {
      return {'statusCode': 400, 'message': 'Invalid Credentials'};
    }
    var jsonResponse = await convert.jsonDecode(response.body);

      return {'statusCode': 200, 'message': jsonResponse.message};
  }
}