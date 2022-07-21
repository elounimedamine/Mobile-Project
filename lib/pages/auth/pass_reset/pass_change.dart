import 'package:application_from_scratch_flutter_9antra_the_bridge/pages/auth/success_reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassChangePage extends StatefulWidget {
  const PassChangePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PassChangeFormValidationState createState() =>
      _PassChangeFormValidationState();
}

class _PassChangeFormValidationState extends State<PassChangePage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/flutter-logo.png')),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your password'),
                  validator: (value) {
                    // add your custom validation here.
                    if (value!.isEmpty) {
                      return 'Please your password';
                    }
                    if (value.length < 4) {
                      return 'Must be more than 4 charater';
                    }
                  },
                  //validatePassword,        //Function to check validation
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      hintText: 'Enter your confirm password'),
                  validator: (value) {
                    // add your custom validation here.
                    if (value!.isEmpty) {
                      return 'Please your confirm password';
                    }
                    if (value.length < 4) {
                      return 'Must be more than 4 charater';
                    }
                  },
                  //validatePassword,        //Function to check validation
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SuccessResetPasswordPage()));
                    print("Validated");
                  } else {
                    print("Not Validated");
                  }
                },
                child: const Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
