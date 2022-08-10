import 'package:application_from_scratch_flutter_9antra_the_bridge/Auth/login.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/services/auth_services.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/theme/color.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _RestPasswordState();
}

class _RestPasswordState extends State<ResetPassword> {
  // ignore: unused_field
  final AuthServices _authServices = AuthServices();

  TextEditingController emailController = TextEditingController();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/images/crud.png',
                    height: 20.0,
                    width: 20.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "Reset Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                leadingIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                ),
                hintText: "Email",
              ),
              const Divider(
                color: Colors.grey,
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CupertinoButton(
                      //width: MediaQuery.of(context).size.width,
                      color: primary,
                      //controller: btnController,
                      onPressed: () async {
                        verifyEmail();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false);
                      },
                      child: const Text("Reset Password",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Future verifyEmail() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
