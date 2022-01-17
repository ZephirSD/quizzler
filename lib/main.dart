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
  int questionNumber = 0;
  List<Icon> listIcons = [];
  List<String> questionList = [
    "Le piton des neiges est un volcan de la Réunion ?",
    "Flutter permet de faire des applications web également",
    "Php est le language utilisé par Flutter"
  ];
  List<bool> reponseList = [true, true, false];
  buttonClick() {
    setState(() {
      questionNumber++;
      questionList[questionNumber];
    });
  }

  trueButton() {
    bool bonnereponse = reponseList[questionNumber];
    setState(() {
      if (bonnereponse == true) {
        listIcons.add(Icon(Icons.check, color: Colors.green));
      } else {
        listIcons.add(Icon(Icons.close, color: Colors.red));
      }
    });
    buttonClick();
  }

  falseButton() {
    bool bonnereponse = reponseList[questionNumber];
    setState(() {
      if (bonnereponse == false) {
        listIcons.add(Icon(Icons.check, color: Colors.green));
      } else {
        listIcons.add(Icon(Icons.close, color: Colors.red));
      }
    });
    buttonClick();
  }

  // falseButton() {
  //   bool bonnereponse = reponseList[questionNumber];
  //   int longueurQuestion = questionList.length;
  //   print('$longueurQuestion');
  //   if (longueurQuestion >= questionNumber) {
  //     if (bonnereponse == false) {
  //       setState(() {
  //         listIcons.add(Icon(Icons.check, color: Colors.green));
  //       });
  //     } else {
  //       setState(() {
  //         listIcons.add(Icon(Icons.close, color: Colors.red));
  //       });
  //     }
  //     print('$questionNumber');
  //     print('$bonnereponse');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  questionList[questionNumber],
                  textAlign: TextAlign.center,
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
                onPressed: () {
                  trueButton();
                },
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
            child: Padding(
              padding: EdgeInsets.all(15),
              child: FlatButton(
                color: Colors.red,
                onPressed: () {
                  falseButton();
                },
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
