import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/summary/views/questions_summary.dart';
import 'package:adv_basic/ui/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/summary/model/summary_mapper.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onFinish,
  });

  final List<String> chosenAnswers;
  final Function() onFinish;

  @override
  Widget build(BuildContext context) {
    final summaryData = SummaryMapper().getSummary(chosenAnswers);
    final numTotalQuestions = questions.length;
    final numCorrectQestions =
        summaryData.where((model) {
          return model.isCorrect;
        }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQestions out of $numTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: titleStyle,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onFinish,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.refresh, color: Colors.white),
              label: Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
