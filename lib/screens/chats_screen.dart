import 'package:daybrec/widgets/message_bubble.dart';
import 'package:daybrec/widgets/new_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../streams/streams.dart';
import '../models/message.dart';
import '../providers/message_provider.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  static const routName = './chatscreen';

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
late DbService _dbService;
@override
  void initState() {
    _dbService =DbService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mesp = Provider.of<MessageProvider>(context);
    //final mes = Provider.of<Message>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: const [
              CircleAvatar(
                foregroundImage: AssetImage(
                  'assets/logo/logo.png',
                ),
                backgroundColor: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text('DAYBREC CREW'),
            ],
          )),
      body: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.topRight,
            child: StreamBuilder<List<Message>>(
                stream: _dbService.chats(),
                builder: (context, snapshot) {
                  
                  if (snapshot.hasData) {
                    final messSnap = snapshot.data!;
                    return ListView.builder(
                      itemCount: messSnap.length,
                      reverse: true,
                      itemBuilder: (ctx, i) =>
                          ChangeNotifierProvider.value(
                            value: messSnap[i],
                            child: MessageBubble(
                             messSnap[i].textMessage,
                             messSnap[i].uid,
                             messSnap[i].date,
                             messSnap[i].username,

                            )),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          )),
          const NewMessage(),
        ],
      ),
    );
  }
}
