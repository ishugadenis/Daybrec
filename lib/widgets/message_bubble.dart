import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: const Border(
              top: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
            ),
          ),
          width: 140,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Hello",
                  style: TextStyle(
                    color: Colors.black,
                  )),
              Container(
                  alignment: Alignment.bottomRight,
                  width: 140,
                  child: const Text(
                    '9:18am',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
