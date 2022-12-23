import 'package:flutter/material.dart';
import '../models/meeting.dart';

class EventsDataSource with ChangeNotifier {
  final List<Meeting> _meetings = <Meeting>[];

  List<Meeting> get meetings {
    return [..._meetings];
  }

  void addMeeting(
    String eventName,
    DateTime from,
    DateTime to,
  ) {
    _meetings.add(Meeting(
       eventName, from, to, Colors.black, false));
    notifyListeners();
  }
  
    
}
