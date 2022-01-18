import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question("question1", true),
    Question("question2", false),
    Question("question3", true)
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
