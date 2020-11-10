import 'package:akademix_student/ui/nested/child_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text('homepage'),
            color: Colors.lightBlue,
          ),
          FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChildPage(),
                    ));
              },
              child: Text('go to child'))
        ],
      ),
    );
  }
}
