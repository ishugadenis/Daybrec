import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = './profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text('Profile')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(15, 30, 15, 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      maxRadius: 40,
                    ),
                    Text('Tevin Ishuga'),
                    Divider(
                      thickness: 1,
                    ),
                    Text('Phone number: 0710753221'),
                    Divider(
                      thickness: 1,
                    ),
                    Text('Position: Manager'),
                    Divider(
                      thickness: 1,
                    ),
                    Text('Email: tevin@gmail.com'),
                    Divider(
                      thickness: 1,
                    ),
                    Text('Log out'),
                  ]),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          const SizedBox(child: BottomNav()),
        ],
      ),
    );
  }
}
