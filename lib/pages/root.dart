import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'login.dart';

class RootApp extends StatefulWidget {
  const RootApp({ Key? key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return auth.currentUser != null ? const HomePage() : const LoginPage();
  }
}