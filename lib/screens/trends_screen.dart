import 'dart:io';

import 'package:daybrec/screens/authentication_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/app_drawer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'chats_screen.dart';

class TrendsScreen extends StatefulWidget {
  const TrendsScreen({Key? key}) : super(key: key);

  static const routeName = './trendsScreen';

  @override
  State<TrendsScreen> createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  @override
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> showMeMyToken() async {
    var myToken = await messaging.getToken();
    print("My Token is: " + myToken.toString());
  }

  void initState() {
    super.initState();
    showMeMyToken();
     FirebaseMessaging.instance.getInitialMessage().then((value) {
       if(value != null)
        {
          Navigator.push(context,
          MaterialPageRoute(
              builder: (context){return const ChatsScreen();},
          settings: RouteSettings(arguments: value.data,),
         ),
        );
       }
     });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {


        if (message.notification != null) {
           print('Message on Foreground: ${message.notification}');
              }
         });
    
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message)
       {
         Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) {return const ChatsScreen();},
               settings: RouteSettings(arguments: message.data,)
          ),
        );
     });
     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Trending'),
              FaIcon(
                FontAwesomeIcons.fire,
                color: Colors.white,
              ),
              FaIcon(
                FontAwesomeIcons.fire,
                color: Colors.white,
              ),
            ],
          ),
          actions: [
            DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryColor,
              ),
              items: [
                DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.exit_to_app),
                        SizedBox(width: 8),
                        Text('Logout'),
                      ],
                    ),
                  ),
                  value: 'logout',
                ),
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushReplacementNamed(AuthenticationScreen.routeName);
                }
              },
            ),
          ],
          // actions: [
          //   PopupMenuButton(
          //     // add icon, by default "3 dot" icon
          //     // icon: Icon(Icons.book)
          //     itemBuilder: (context) {
          //       return [
          //       PopupMenuItem<int>(
          //         value: 0,
          //         child:  Column(
          //                 children: [
          //                   const Icon(
          //                     FontAwesomeIcons.userAstronaut,
          //                     color: Colors.black,
          //                   ),
          //                   InkWell(
          //                     onTap: () {
          //                       Navigator.pushReplacementNamed(
          //                           context, AuthenticationScreen.routeName);
          //                     },
          //                     child: Padding(
          //                       padding:
          //                           const EdgeInsets.symmetric(vertical: 10),
          //                       child: Row(
          //                         children: const [
          //                           Text('Log in'),
          //                           Icon(Icons.login, color: Colors.black)
          //                         ],
          //                       ),
          //                     ),
          //                   )
          //                 ],
          //               )

          //       ),
          //     ];
          //   },
          // )
          //],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  child: const WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://www.youtube.com/feed/trending',

                // https://audiomack.com'
              )),
            ),
            const BottomNav(),
          ],
        ));
  }
}

 Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
     await Firebase.initializeApp();

      print("Handling a background message :-): ${message.data}");
      //Here you can do what you want with the message :-)
     }
