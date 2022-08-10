import 'package:application_from_scratch_flutter_9antra_the_bridge/Auth/login.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/Crud/home_page.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/Widgets/custom_dialog.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/model/end_user.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/services/auth_services.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/theme/color.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool hidedPwd = true;

  bool hidenConPwd = true;

  final AuthServices _authServices = AuthServices();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
      //final RoundedLoadingButtonController btnController =RoundedLoadingButtonController();
      

  @override
  Widget build(BuildContext context) {
    floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat;
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
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                controller: nameController,
                leadingIcon: const Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
                hintText: "Name",
              ),
              const Divider(
                color: Colors.grey,
                height: 10,
              ),
              const SizedBox(
                height: 10,
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
                obscureText: hidedPwd,
                hintText: "Password",
              ),
              const Divider(
                color: Colors.grey,
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: confirmPasswordController,
                leadingIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ),
                obscureText: hidenConPwd,
                hintText: "Confirm Password",
              ),
              const Divider(
                color: Colors.grey,
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
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
                      FocusScope.of(context).unfocus();
                      registerProceed();
                    },
                    child: const Text("Register",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
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
                  const Text("Have an account?"),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginPage()));
                      },
                      child: const Text(
                        "Sign In",
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
   registerProceed() async {
    if (passwordController.text != confirmPasswordController.text) {
      //btnController.reset();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CustomDialogBox(
              descriptions: "Password and Confirm Password are not matched.",
            );
          });
      return;
    }

    var res = await _authServices.registerWithEmailPassword(
        nameController.text, emailController.text, passwordController.text);
    if (res["status"] == false) {
      //btnController.reset();
      print("Failed");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: "Register",
              descriptions: res["message"],
            );
          });
    } else {
      //btnController.success();
      print("Success");
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false);
    }
  }
}
