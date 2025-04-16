class SummaryModel {
  const SummaryModel({
    required this.index,
    required this.questionText,
    required this.questionAnswer,
    required this.userAnswer,
    required this.isCorrect,
  });

  final int index;
  final String questionText;
  final String questionAnswer;
  final String userAnswer;
  final bool isCorrect;
}
