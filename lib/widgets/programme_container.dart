import 'package:daybrec/screens/schedule_screen.dart';
import 'package:flutter/material.dart';

import '../models/programme_model.dart';

class ProgrammeContainer extends StatelessWidget {
  Programme programme;

  ProgrammeContainer({Key? key, required this.programme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, programme.route);
      },
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.32,
        // height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: const Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black),
          ),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.17,
              // width: MediaQuery.of(context).size.width * 0.32,
              child: Image.asset(programme.imageUrl, fit: BoxFit.contain),
            ),
          ),
          Text(programme.name)
        ]),
      ),
    );
  }
}
