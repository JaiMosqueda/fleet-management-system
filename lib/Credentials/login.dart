import 'package:fleet_management/Home/home_page.dart';
import 'package:fleet_management/models/api.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(context) async {
    if(!formKey.currentState!.validate()) {
      return;
    }

    Map credentials = {
      'email': emailController.text,
      'password': passwordController.text
    };

    var response = await Api.instance.login(credentials);

    if(response.statusCode != 200) {
      // Show error message that is invalid credentials
    }

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) => const HomePage()
    ), (route) => false);

    @override
    void dispose() {
      emailController;
      passwordController;
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 350,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'LTS',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: 'Cooper Black',
                ),
              ),
              const Text('TRUCKING SERVICES',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: 'Cooper Black',
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Email', labelText: 'Email'),
                  controller: emailController,
                ),
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Password', labelText: 'Password'),
                  controller: passwordController,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      login(context);
                    },
                    child: Text('Login')),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                    text: 'Don\'t have an Account?',
                    style: TextStyle(
                      color: Colors.white38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: ' '),
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
