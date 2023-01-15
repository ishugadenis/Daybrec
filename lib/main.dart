import 'package:daybrec/providers/cart_provider.dart';
import 'package:daybrec/providers/events_provider.dart';
import 'package:daybrec/providers/message_provider.dart';
import 'package:daybrec/screens/authentication_screen.dart';
import 'package:daybrec/screens/chats_screen.dart';
import 'package:daybrec/screens/day_details.dart';
import 'package:daybrec/screens/flash_sales_screen.dart';
import 'package:daybrec/screens/tower_screen.dart';
import 'package:daybrec/screens/schedule_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/product_provider.dart';
import 'screens/cart_screen.dart';
import 'screens/catalog_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/trends_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: EventsDataSource()),
        ChangeNotifierProvider.value(value: MessageProvider()),
        ChangeNotifierProvider.value(value: ProductList()),
        ChangeNotifierProvider.value(value: Cart())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.hasData) {
                return const TrendsScreen();
              }
              return AuthenticationScreen();
            }),
        routes: {
          ChatsScreen.routName: (_) => const ChatsScreen(),
          TrendsScreen.routeName: (_) => const TrendsScreen(),
          ProfileScreen.routeName: (_) => const ProfileScreen(),
          TowerScreen.routeName: (_) => TowerScreen(),
          ScheduleScreen.routeName: (_) => const ScheduleScreen(),
          AuthenticationScreen.routeName: (_) => AuthenticationScreen(),
          DayDetails.routeName: (_) => const DayDetails(),
          FlashSalesScreen.routeName: (_) => const FlashSalesScreen(),
          CatalogScreen.routeName: (_) => const CatalogScreen(),
          CartScreen.routeName:(_) =>  const CartScreen(),
        },
      ),
    );
  }
}
