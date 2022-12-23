import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/bottom_nav.dart';

class TrendsScreen extends StatefulWidget {
  const TrendsScreen({Key? key}) : super(key: key);

  static const routeName = './trendsScreen';

  @override
  State<TrendsScreen> createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            PopupMenuButton(
              
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                      value: 0,
                      child: Column(
                        children: [
                          const Icon(
                            FontAwesomeIcons.userAstronaut,
                            color: Colors.black,
                          ),
                          InkWell(
                            onTap: () {
                              print('xx');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: const [
                                  Text('Log in'),
                                  Icon(Icons.login, color: Colors.black)
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ];
              },
            )
          ],
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
