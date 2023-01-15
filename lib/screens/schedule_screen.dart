import 'dart:convert';

import 'package:daybrec/providers/events_provider.dart';
import 'package:daybrec/screens/day_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:date_time_picker/date_time_picker.dart';
import '../models/meeting.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  static const routeName = './scheduleScreen';

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  var startTime = DateTime.now().toString();
  var endTime = DateTime.now().toString();

  final _eventNameController = TextEditingController();
  final CalendarController _controller = CalendarController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ev = Provider.of<EventsDataSource>(context);
    void makeSchedule() => showDialog(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: AlertDialog(
                title: const Text('Create Event'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _eventNameController,
                      decoration: const InputDecoration(
                        hintText: 'Event name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Starts"),
                    DateTimePicker(
                      type: DateTimePickerType.dateTimeSeparate,
                      initialValue: DateTime.now().toString(),
                      dateMask: 'd MMM yyy',
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      //controller: _startTimeController,
                      icon: const Icon(Icons.event),
                      dateLabelText: 'Date',
                      timeLabelText: ' Hour',
                      onChanged: (val) {
                        startTime = val;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Ends"),
                    DateTimePicker(
                      //controller: _endTimeController,
                      initialValue: DateTime.now().toString(),
                      type: DateTimePickerType.dateTimeSeparate,
                      dateMask: 'd MMM yyy',
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      icon: const Icon(Icons.event),
                      dateLabelText: 'Date',
                      timeLabelText: ' Hour',
                      onChanged: (val) {
                        endTime = val;
                      },
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        ev.addMeeting(
                            _eventNameController.text,
                            DateTime.tryParse(startTime)!,
                            DateTime.tryParse(endTime)!);
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('Okay')),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Cancel'),
                  )
                ],
              ),
            ));
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: makeSchedule, child: const Icon(Icons.add)),
          body: Stack(
            children: [
              SfCalendar(
                headerHeight: 50,
                headerStyle: const CalendarHeaderStyle(
                  textStyle: TextStyle(),
                ),

                view: CalendarView.schedule,
                minDate: DateTime.now(),
                maxDate: DateTime(2024, 9, 7, 17, 30),
                showDatePickerButton: true,
                allowedViews: const [
                  CalendarView.day,
                  CalendarView.week,
                  CalendarView.month,
                  CalendarView.schedule
                ],
                showNavigationArrow: true,
                // maxDate: DateTime(),
                allowDragAndDrop: true,
                 
                onTap: (CalendarTapDetails details) {
                  print(details.targetElement.toString());
                  print(details.date);
                  
                  DateTime date = details.date!;
                  dynamic appointments = details.appointments;
                  CalendarElement view = details.targetElement;
                  Navigator.of(context).pushNamed(
                    DayDetails.routeName,arguments: details
                  );
                },

                dataSource: MeetingDataSource(ev.meetings),
                monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
              ),
              Positioned(
                top: 0,
                height: 0,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              )
            ],
          )),
    );
  }


}

//
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

//
  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}
