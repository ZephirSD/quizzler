import 'package:flutter/material.dart';
import 'quiz-brain.dart';

QuizBrain quizBrain = QuizBrain();

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
  trueButton() {
    setState(() {
      bool bonnereponse = quizBrain.getQuestionAnswer();
      if (listIcons.length != quizBrain.longueurQuestion()) {
        if (bonnereponse == true) {
          listIcons.add(Icon(Icons.check, color: Colors.green));
        } else {
          listIcons.add(Icon(Icons.close, color: Colors.red));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  falseButton() {
    setState(() {
      bool bonnereponse = quizBrain.getQuestionAnswer();
      if (listIcons.length != quizBrain.longueurQuestion()) {
        if (bonnereponse == false) {
          listIcons.add(Icon(Icons.check, color: Colors.green));
        } else {
          listIcons.add(Icon(Icons.close, color: Colors.red));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  void alertScore(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Vous avez terminé!!"),
          content: new Text("Voici votre score"),
          actions: [
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                  quizBrain.getQuestionText(),
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
