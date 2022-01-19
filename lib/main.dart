import 'package:flutter/material.dart';
import 'quiz/quiz1.dart';
import 'quiz/quiz2.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Accueil(),
      ),
    ),
  );
}

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(color: Colors.grey.shade900),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 45),
                  color: Colors.purple,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quizzler1()),
                    );
                  },
                  child: Text(
                    'Quiz1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 45),
                  color: Colors.purple.shade600,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quizzler2()),
                    );
                  },
                  child: Text(
                    'Quiz2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 45),
                  color: Colors.purple.shade400,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quizzler2()),
                    );
                  },
                  child: Text(
                    'Quiz3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
