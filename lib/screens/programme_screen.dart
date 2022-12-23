// ignore_for_file: sort_child_properties_last

import 'package:daybrec/screens/schedule_screen.dart';
import 'package:daybrec/widgets/programme_container.dart';
import 'package:flutter/material.dart';
import '../models/programme_model.dart';
import '../widgets/bottom_nav.dart';

class ProgrammeScreen extends StatelessWidget {
  List Programmes = [
    Programme(name: 'Attendance', imageUrl: 'assets/profiles/attendance.png', route: ScheduleScreen.routeName),
    Programme(name: 'Schedule', imageUrl: 'assets/profiles/schedule.jpg', route: ScheduleScreen.routeName),
    Programme(name: 'Support', imageUrl: 'assets/profiles/support.png', route: ScheduleScreen.routeName),
    Programme(name: 'Task', imageUrl: 'assets/profiles/task.jpg', route: ScheduleScreen.routeName),
  ];

  static const routeName = './programmeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Program'),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView(
               padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                children: Programmes.map((e) => ProgrammeContainer(
                  programme: e,
                )).toList(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            ),
            const BottomNav(),
          ],
        ));
  }
}
