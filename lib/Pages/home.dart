import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    var _data;
  @override
  void initState() {
    _data = 'API LINK';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Schedule'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              FutureBuilder(future:_data,
                  builder: (context, snapshot){
                      if (snapshot.hasData) {
                        return getData();
                      }
                      else {
                        return CircularProgressIndicator();
                      }
                  })
            ],
          ),
        ),
      ),
    );
  }

  getData () async {
    return await http.get(
      Uri.parse(_data),
      headers: {
        'Accept': 'application/json'
      },
    );
  }
}
