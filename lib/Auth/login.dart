import 'package:application_from_scratch_flutter_9antra_the_bridge/crud/home_page.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/Auth/forget_password.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/services/auth_services.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/theme/color.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscureText = true;

  final AuthServices _authServices = AuthServices();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              const SizedBox(
                height: 80,
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
                height: 10,
              ),
              CustomTextField(
                controller: passwordController,
                leadingIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ),
                obscureText: isObscureText,
                hintText: "Password",
              ),
              const Divider(
                color: Colors.grey,
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ResetPassword()));
                  },
                  child: const Text(
                    "Forget Password",
                    style: TextStyle(
                        fontSize: 15,
                        color: primary,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
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
                        if (emailController.text.trim().isEmpty ||
                            passwordController.text.isEmpty) {
                          const snackbar = SnackBar(
                              content: Text("Email/Password cannot be empty!"));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        } else {
                          dynamic creds = await _authServices.loginUser(
                              emailController.text, passwordController.text);
                          if (creds == null) {
                            const snackbar = SnackBar(
                                content: Text("Email/Password invalid!"));
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          } else {
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        }
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              )),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const RegisterPage()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 15,
                            color: primary,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
