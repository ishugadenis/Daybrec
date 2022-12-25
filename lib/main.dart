import 'package:daybrec/providers/events_provider.dart';
import 'package:daybrec/screens/authentication_screen.dart';
import 'package:daybrec/screens/chats_screen.dart';
import 'package:daybrec/screens/programme_screen.dart';
import 'package:daybrec/screens/schedule_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/profile_screen.dart';
import 'screens/trends_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: EventsDataSource())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Roboto',
            primarySwatch: Colors.pink,
            backgroundColor: Colors.black,
            accentColor: Colors.purple,
            accentColorBrightness: Brightness.dark,
            buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.black,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )),
        home: const TrendsScreen(),
        routes: {
          ChatsScreen.routName: (_) => const ChatsScreen(),
          TrendsScreen.routeName: (_) => const TrendsScreen(),
          ProfileScreen.routeName: (_) => const ProfileScreen(),
          ProgrammeScreen.routeName: (_) => ProgrammeScreen(),
          ScheduleScreen.routeName: (_) => const ScheduleScreen(),
          AuthenticationScreen.routeName: (_) =>  AuthenticationScreen(),
        },
      ),
    );
  }
}
