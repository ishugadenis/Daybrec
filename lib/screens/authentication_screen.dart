import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationScreen extends StatefulWidget {


  static const routeName = './authScreen';
  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  // const AuthenticationScren({Key? key}) : super(key: key);

  
  final _auth = FirebaseAuth.instance;

  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user?.uid)
            .set({
          'username': username,
          'email': email,
        });
        await FirebaseFirestore.instance
            .collection('goals')
            .doc(authResult.user?.uid)
            .set({
          'targetWeight': '40',
          'isTargetSet': true,
          'userId': FirebaseAuth.instance.currentUser?.uid
        });
      }
    } on PlatformException catch (err) {
      var message = 'Ann error occured, please check your credentials';
      if (err.message! == null) {
        message = err.message!;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).primaryColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://media.istockphoto.com/photos/sport-fitness-weightlifting-sports-injury-and-people-concept-young-picture-id1329114981?s=2048x2048'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AuthenticationForm(_submitAuthForm, _isLoading),
        ),
      ),
    );
  }
}
