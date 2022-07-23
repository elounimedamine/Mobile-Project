import 'package:application_from_scratch_flutter_9antra_the_bridge/screens/auth/pass_reset/pass_change.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodeVerifPage extends StatefulWidget {
  const CodeVerifPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CodeVerifFormValidationState createState() =>
      _CodeVerifFormValidationState();
}

class _CodeVerifFormValidationState extends State<CodeVerifPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 150,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Code',
                      hintText: 'Enter your code'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your code please';
                    }
                    if (value.length < 4 || value.length > 4) {
                      return 'Must be 4 number';
                    }
                    return null;
                  },
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
                            builder: (_) => const PassChangePage()));
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
