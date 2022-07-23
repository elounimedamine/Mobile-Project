import 'package:application_from_scratch_flutter_9antra_the_bridge/constants.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/screens/auth/login.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/widgets/home/home_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const HomeBody(),
      appBar: AppBar(
        title: const Text('Application E-Commerce'),
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey.shade500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                    radius: 40.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Tom Cruise',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'tomcruise@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14.0),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Here you place your menu items
            ListTile(
              leading: const Icon(Icons.home),
              title:
                  const Text("Page D'acceuil", style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Paramètres', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.close),
            //   title:
            //       const Text('Fermer Drawer', style: TextStyle(fontSize: 18)),
            //   onTap: () {
            //     // Here you can give your route to navigate
            //     Navigator.of(context).pop();
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Déconnexion', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
