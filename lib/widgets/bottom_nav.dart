import 'package:daybrec/screens/tower_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/chats_screen.dart';
import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';
import '../screens/trends_screen.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: const Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, ProfileScreen.routeName);
                },
                icon: const FaIcon(FontAwesomeIcons.userAstronaut)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ChatsScreen.routName);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.rocketchat,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, TrendsScreen.routeName);
                },
                icon: const FaIcon(FontAwesomeIcons.fire)),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, TowerScreen.routeName);
                },
                icon: const FaIcon(FontAwesomeIcons.solidCalendar)),
          ],
        ));
  }
}
