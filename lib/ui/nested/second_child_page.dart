import 'package:flutter/material.dart';

class SecondChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('something inside 2nd child'),
        toolbarHeight: 150,
      ),
      body: Center(
        child: Container(
          child: FlatButton(
              onPressed: () => Navigator.pop(context), child: Text('goback')),
        ),
      ),
    );
  }
}
