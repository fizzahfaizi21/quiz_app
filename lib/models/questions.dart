import 'package:html_unescape/html_unescape.dart';

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var unescape = HtmlUnescape();

    // Decode HTML entities in the question and answers
    String decodedQuestion = unescape.convert(json['question']);
    String decodedCorrectAnswer = unescape.convert(json['correct_answer']);

    // Decode and create a list of incorrect answers
    List<String> decodedIncorrectAnswers = (json['incorrect_answers'] as List)
        .map((answer) => unescape.convert(answer.toString()))
        .toList();

    // Combine and shuffle all options
    List<String> options = [...decodedIncorrectAnswers];
    options.add(decodedCorrectAnswer);
    options.shuffle();

    return Question(
      question: decodedQuestion,
      options: options,
      correctAnswer: decodedCorrectAnswer,
    );
  }
}
