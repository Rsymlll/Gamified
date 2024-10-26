
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //initialize textfield controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
            ElevatedButton(
                onPressed: () {
                  if (usernameController.text == "haziq@mail.com" &&
                      passwordController.text == "123456") {
                    //Pergi ke page question
                    Navigator.pushNamed(context, "/dashboard");
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const ChallengeSelection()));
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text("Wrong credentials"),
                          );
                        });
                  }
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}