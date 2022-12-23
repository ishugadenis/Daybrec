import 'package:daybrec/providers/events_provider.dart';
import 'package:daybrec/screens/chats_screen.dart';
import 'package:daybrec/screens/programme_screen.dart';
import 'package:daybrec/screens/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/profile_screen.dart';
import 'screens/trends_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: EventsDataSource()
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TrendsScreen(),
        routes: {
          ChatsScreen.routName :(_) => const ChatsScreen(),
          TrendsScreen.routeName: (_) => const TrendsScreen(),
          ProfileScreen.routeName: (_) => const ProfileScreen(),
          ProgrammeScreen.routeName: (_) => ProgrammeScreen(),
          ScheduleScreen.routeName: (_) => const ScheduleScreen(),
        },
      ),
    );
  }
}

