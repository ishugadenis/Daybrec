import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 8),
      padding:const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Send a message...') ,
              onChanged: (value){
                setState(() {
               
                });
              },


            ),
          ),
          IconButton(
              color: Theme.of(context).primaryColor,
              onPressed:(){},
              icon: const Icon(
                Icons.send,
              )
          ),
        ],
      ),
    );
  }
}