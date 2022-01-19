import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question("Le piton des neiges est un volcan de la Réunion ?", true),
    Question("Flutter permet de faire des applications web également ?", true),
    Question("Php est le language utilisé par Flutter ?", false)
  ];
  longueurQuestion() {
    return _questions.length;
  }

  nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }
}
