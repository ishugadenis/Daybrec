import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/message.dart';

class MessageBubble extends StatelessWidget {
  //Message message;
  MessageBubble(this.textMessage, this.uid, this.date, this.username);
  String textMessage;
  String uid;
  Timestamp date;
  String username;

  final isMe = FirebaseAuth.instance.currentUser!.uid;

  x(ctx) {
    BoxConstraints bx = BoxConstraints(
        maxWidth: MediaQuery.of(ctx).size.width * 0.7, minWidth: 100);
    return bx;
  }

  @override
  Widget build(BuildContext context) {
    final message = Provider.of<Message>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      alignment: (uid == isMe) ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (uid == isMe)
                  ? const Text(
                      'You',
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    )
                  : Text(
                      message.username,
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    ),
              Container(
                decoration: BoxDecoration(
                  color: (uid == isMe) ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: (uid == isMe) ? const Radius.circular(0):const Radius.circular(12),
                    bottomRight: (uid == isMe) ? const Radius.circular(12):const Radius.circular(0),
                    topLeft: (uid == isMe) ? const Radius.circular(12):const Radius.circular(0),
                    topRight: (uid == isMe) ? const Radius.circular(0):const Radius.circular(12),
                  ),
                  border: const Border(
                    top: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                  ),
                ),
                constraints: x(context),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      constraints: x(context),
                      child: Text(message.textMessage,
                          style: TextStyle(
                            color: (uid == isMe) ? Colors.black : Colors.white,
                          )),
                    ),
                    Align(
                      widthFactor: 1.5,
                      alignment: Alignment.bottomRight,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        width: 70,
                        child: Text(
                          textAlign: TextAlign.right,
                          DateFormat.jm().format(message.date.toDate()),
                          style: TextStyle(
                            fontSize: 11,
                            color: (uid == isMe) ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
