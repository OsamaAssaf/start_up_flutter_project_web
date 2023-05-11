import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        width: 260,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          width: 100,
          height: double.infinity,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Column(
                children: [
                  const UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    accountName: Text(
                      'User Name',
                      style: TextStyle(fontSize: 18),
                    ),
                    accountEmail: Text(
                      'username@example.com',
                    ),
                    currentAccountPicture: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 33.5,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Home'),
                    leading: const Icon(Icons.home),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Feedback'),
                    leading: const Icon(Icons.feedback_outlined),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('About Us'),
                    leading: const Icon(Icons.people_alt_outlined),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Terms and Conditions'),
                    leading: const Icon(Icons.privacy_tip_outlined),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Setting'),
                    leading: const Icon(Icons.settings_suggest_outlined),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Log Out'),
                    leading: const Icon(Icons.logout),
                    onTap: () {},
                  ),
                  // const Divider(
                  //   height: 1,
                  //   color: Colors.grey,
                  // ),
                  // ListTile(
                  //   title: const Text(
                  //     'Log Out',
                  //     style: TextStyle(
                  //       //fontFamily: AppTheme.fontName,
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: 12,
                  //       color: Colors.red,
                  //     ),
                  //     textAlign: TextAlign.left,
                  //   ),
                  //   subtitle: const Text(
                  //     '1.1.13',
                  //     style: TextStyle(
                  //       //fontFamily: AppTheme.fontName,
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: 10,
                  //       color: Colors.grey,
                  //     ),
                  //     textAlign: TextAlign.left,
                  //   ),
                  //   trailing: const Icon(
                  //     Icons.logout,
                  //     color: Colors.red,
                  //     size: 20,
                  //   ),
                  //   onTap: () {},
                  // ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
