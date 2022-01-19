import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz-brain.dart';
import 'main.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
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
  int scoreTrue = 0;
  checkAnswer(bool reponseutilisateur) {
    setState(() {
      bool bonnereponse = quizBrain.getQuestionAnswer();
      int longueurList = listIcons.length;
      if (listIcons.length != quizBrain.longueurQuestion()) {
        if (reponseutilisateur == bonnereponse) {
          listIcons.add(Icon(Icons.check, color: Colors.green));
          scoreTrue++;
        } else {
          listIcons.add(Icon(Icons.close, color: Colors.red));
        }
        quizBrain.nextQuestion();
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Vous avez terminé!!",
          desc:
              "Voici votre score $scoreTrue/$longueurList de bonne(s) réponse(s)",
          buttons: [
            DialogButton(
              child: Text(
                "Terminé",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Accueil()),
                );
              },
              width: 120,
            )
          ],
        ).show();
        quizBrain.reset();
        listIcons = [];
        scoreTrue = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.grey.shade900),
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
                      decoration: TextDecoration.none),
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
                  checkAnswer(true);
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
                  checkAnswer(false);
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
              child: Row(
                children: listIcons,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
