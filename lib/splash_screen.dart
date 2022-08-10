import 'package:application_from_scratch_flutter_9antra_the_bridge/Auth/login.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/Auth/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 221, 183, 13)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Icon(
                        Icons.person_add,
                        color: Colors.black,
                        size: 50.0,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10.0)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Crud Application",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CupertinoButton.filled(
                        child: const Text("Sign In"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginPage()));
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoButton.filled(
                        child: const Text("Sign Up"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RegisterPage()));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
