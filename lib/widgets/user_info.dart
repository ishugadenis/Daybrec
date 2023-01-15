import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/authentication_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/capture_profile.dart';

class UserInfo extends StatelessWidget {
  UserInfo({
    Key? key,
  }) : super(key: key);

  var collection = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: collection.doc(FirebaseAuth.instance.currentUser!.uid).get(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');
        if (snapshot.hasData) {
          var data = snapshot.data!.data();
          //var value = data!['some_field'];
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CaptureProfile(imageUrl: data!['imageUrl'] ?? ''),
                Text(data['username'] ?? ''),
                const Divider(
                  thickness: 1,
                ),
                Text('Phone number: +254 ${data['phoneNumber'] ?? ''}'),
                const Divider(
                  thickness: 1,
                ),
                const Text('Position: Member'),
                const Divider(
                  thickness: 1,
                ),
                Text('Email: ${data['email'] ?? ''} '),
                const Divider(
                  thickness: 1,
                ),
                TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context)
                          .pushReplacementNamed(AuthenticationScreen.routeName);
                    },
                    child: const Text('Log out'))
              ]);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
