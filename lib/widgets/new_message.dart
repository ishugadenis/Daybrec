import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/message_provider.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _enteredMessage = '';

  final _textMessageController = TextEditingController();
  @override
  void _sendMessage() {
    FocusScope.of(context).unfocus();
    Provider.of<MessageProvider>(context, listen: false).sendMessage(
        _enteredMessage,
        DateTime.now(),
        FirebaseAuth.instance.currentUser!.uid);
    _textMessageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final mesp = Provider.of<MessageProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textMessageController,
              decoration: const InputDecoration(labelText: 'Send a message...'),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
              color: Theme.of(context).primaryColor,
              onPressed: _enteredMessage.trim().isEmpty
                  ? null
                  :_sendMessage,
              icon: const Icon(
                Icons.send,
              )),
        ],
      ),
    );
  }
}
