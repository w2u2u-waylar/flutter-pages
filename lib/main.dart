import 'package:flutter/material.dart';
import 'package:myflutter/secondpage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  final int icounter; // Can initial counter from outside

  FirstPage({Key key, this.icounter = 10}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int counter; // Initial state counter with null value
  String txt = "inital text";

  void _adjustCounter(int newCounter, String newTxt) {
    setState(() {
      counter = newCounter; // Set counter from caller
      txt = newTxt;
    });
  }

  @override
  void initState() {
    super.initState();
    counter = widget.icounter; // Copy initial counter to state when page build
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Counter: $counter'),
              Text('Text: $txt'),
              RaisedButton(
                child: Text('Go to 2nd page'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(
                        adjustCounter:
                            _adjustCounter, // Pass function to another page
                      ),
                    ),
                  );
                },
              ),
            ]),
      ),
    );
  }
}
