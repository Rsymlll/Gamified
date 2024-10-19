import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //initialize textfield controller
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {
              if(usernameController.text == "haziq@mail.com" && passwordController.text == "123456")
              {
                Navigator.pushNamed(context, "/dashboard");
              }

              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Wrong credentials"),
                );
              });
            }, child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
