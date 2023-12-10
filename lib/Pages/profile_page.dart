import 'package:fleet_management/Credentials/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Logged out',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged Out')));
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ],
    ));
  }

  void logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var url = 'API';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Authorization":"Bearer $token",
        "Accept":"application/json"
      },
    );
    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    _showMsg('Logout Sucessfully');
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
        content: Text(msg),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {},
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
