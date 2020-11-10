import 'package:akademix_student/ui/nested/child_page.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  final Function onNext;

  const CalendarPage({Key key, this.onNext}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.green,
            child: Text('calendar page'),
          ),
          FlatButton(onPressed: onNext, child: Text('go to child'))
        ],
      )),
    );
  }
}
