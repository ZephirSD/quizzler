import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Quizzler(),
      ),
    ),
  );
}

class Quizzler extends StatefulWidget {
  Quizzler({Key? key}) : super(key: key);

  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> listIcons = [];
  List<String> questionList = [
    "Question1",
    "Question2",
    "Question3",
    "Question4",
    "Question5",
  ];
  trueBoutton() {
    setState(() {
      listIcons.add(Icon(Icons.check, color: Colors.green));
    });
  }

  falseBoutton() {
    setState(() {
      listIcons.add(Icon(Icons.close, color: Colors.red));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  questionList[1],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: FlatButton(
                color: Colors.green,
                onPressed: (trueBoutton),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: FlatButton(
                color: Colors.red,
                onPressed: (falseBoutton),
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Expanded(
                flex: 1,
                child: Row(
                  children: listIcons,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
