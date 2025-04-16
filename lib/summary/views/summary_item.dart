import 'package:adv_basic/summary/model/summary_model.dart';
import 'package:adv_basic/summary/views/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.model});

  final SummaryModel model;

  @override
  Widget build(BuildContext context) {
    var questionStyle = GoogleFonts.deliciousHandrawn(
      color: const Color.fromARGB(255, 239, 233, 244),
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );

    TextStyle answerStyle(Color answerColor) {
      return GoogleFonts.deliciousHandrawn(
        color: answerColor,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );
    }

    var sequence = model.index;
    var question = model.questionText;
    var userAnswer = model.userAnswer;
    var correctAnswer = model.questionAnswer;
    var color =
        correctAnswer == userAnswer
            ? const Color.fromARGB(255, 8, 123, 94)
            : const Color.fromARGB(255, 237, 56, 176);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(identifier: sequence, model: model),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(question, style: questionStyle),
                const SizedBox(height: 5),
                Text('You: $userAnswer', style: answerStyle(color)),
                Text(
                  'Correct answer: $correctAnswer',
                  style: answerStyle(const Color.fromARGB(255, 170, 202, 194)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
