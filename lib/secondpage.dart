import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final Function(int, String) adjustCounter;

  SecondPage({@required this.adjustCounter}) : super();

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('Set 256 and xyz'),
              onPressed: () {
                widget.adjustCounter(256, "xyz"); // Set first page state
                Navigator.pop(context); // And back to first page
              },
            ),
          ],
        ),
      ),
    );
  }
}
