import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/user_info.dart';

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
              child:  UserInfo(),
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


