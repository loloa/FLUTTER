import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/summary/model/summary_model.dart';

class SummaryMapper {
  List<SummaryModel> getSummary(List<String> chosenAnswers) {
    final List<SummaryModel> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        SummaryModel(
          index: i,
          questionText: questions[i].text,
          questionAnswer: questions[i].answers[0],
          userAnswer: chosenAnswers[i],
          isCorrect: questions[i].answers[0] == chosenAnswers[i],
        ),
      );
    }
    return summary;
  }
}
