import 'package:application_from_scratch_flutter_9antra_the_bridge/pages/auth/login.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/pages/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //the stack allows developers to overlap multiple widgets into a single screen and renders them from bottom to top
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.grey),
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
                        Icons.local_grocery_store,
                        color: Colors.black,
                        size: 50.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(padding: EdgeInsets.only(top: 10.0)),
                    const Text(
                      "E-Commerce Application",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 30),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      color: CupertinoColors.activeBlue,
                      child: const Text("Sign In"),
                    ),
                    const SizedBox(height: 20),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                      color: CupertinoColors.activeBlue,
                      child: const Text("Sign Up"),
                    ),
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
