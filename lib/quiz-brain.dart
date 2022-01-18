import 'question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question("question1", true),
    Question("question2", false),
    Question("question3", true)
  ];
  String getQuestionText(int questionNumber) {
    return _questions[questionNumber].questionText;
  }

  bool getQuestionAnswer(int questionNumber) {
    return _questions[questionNumber].questionAnswer;
  }
}
