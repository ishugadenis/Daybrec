import 'package:daybrec/widgets/message_bubble.dart';
import 'package:daybrec/widgets/new_message.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  static const routName = './chatscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: const [
              CircleAvatar(),
              SizedBox(
                width: 10,
              ),
              Text('DAYBREC CREW'),
            ],
          )
          ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  alignment: Alignment.topRight, child: const MessageBubble())),
          NewMessage(),
        ],
      ),
    );
  }
}
