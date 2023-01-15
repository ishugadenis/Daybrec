import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message.dart';

class MessageProvider with ChangeNotifier {
  List<Message> _messo = [];

  List<Message> get messo {
    return [..._messo];
  }

  Future<void> sendMessage(String textMesage, DateTime date, String uid) async {
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot =
        await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var value = data?['username'];

      await FirebaseFirestore.instance.collection('chat').add({
        'username': value,
        'date': DateTime.now(),
        'textMessage': textMesage,
        'uid': FirebaseAuth.instance.currentUser!.uid
      });
      _messo.add(Message(
        date: Timestamp.now(),
        textMessage: textMesage,
        uid: uid,
        username:value,

      ));
      notifyListeners();
    }
  }
}
