import 'package:application_from_scratch_flutter_9antra_the_bridge/Auth/login.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/crud/add_student_page.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/crud/list_student_page.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('CRUD App'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddStudentPage(),
                  ),
                )
              },
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              child: const Text('Add', style: TextStyle(fontSize: 20.0)),
            ),
            ElevatedButton(
              onPressed: () async {
                await _authServices.logout().then((value) =>
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LoginPage())));
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 189, 3, 3)),
              child: const Text('Logout', style: TextStyle(fontSize: 20.0)),
            ),
          ],
        ),
      ),
      body: ListStudentPage(),
    );
  }
}
