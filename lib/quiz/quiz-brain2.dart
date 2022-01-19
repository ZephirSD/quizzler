import '../question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question("Question1", false),
    Question("Question2", true),
    Question("Question3", false),
    Question("Question4", true),
    Question("Question5", true)
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

  void reset() {
    _questionNumber = 0;
  }
}
