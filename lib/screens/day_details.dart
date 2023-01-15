import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class DayDetails extends StatelessWidget {
  const DayDetails({Key? key}) : super(key: key);
  static const routeName = './daydetails';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final routeArgs = ModalRoute.of(context)!.settings.arguments as dynamic;
  //  final eventDate = routeArgs.details.date.toString();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: const CustomAppBar(),
      ),
      body: Column(children: [
        //Text(eventDate)
      ]),
    );
  }
}
