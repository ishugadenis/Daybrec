 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/message.dart';
import '../models/users.dart';

class DbService{

  var uid =FirebaseAuth.instance.currentUser!.uid;

Stream<List<Users>> users() => FirebaseFirestore.instance
     .collection('users').where('userId', isEqualTo: uid)
     .snapshots()
     .map((snapshot) =>
     snapshot.docs.map((e) => Users.fromJson(e.data())).toList());

  
  Stream<List<Message>> chats() => FirebaseFirestore.instance
        .collection('chat').orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((e) => Message.fromJson(e.data())).toList());

}

