import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Message with ChangeNotifier {
  final String textMessage;
  final String uid;
  final Timestamp date;
  final String username;

  Message({required this.textMessage, required this.uid, required this.date, required this.username});

  Map<String, dynamic> toJson() => {
        'textMessage': textMessage,
        'uid': uid,
        'date': date,
        'username': username
      };

  Message.fromJson(Map<dynamic, dynamic> json)
      : textMessage = json['textMessage'] ?? '',
        uid = json['uid'] ?? '',
        date = json['date'] ?? Timestamp.now().toDate(),
        username =json['username'] ?? '' ;
}
