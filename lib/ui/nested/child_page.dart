import 'package:flutter/material.dart';

class ChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('goback'),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('back'))
            ],
          ),
        ),
      ),
    );
  }
}
