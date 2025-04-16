import 'package:adv_basic/summary/model/summary_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.identifier,
    required this.model,
  });

  final int identifier;
  final SummaryModel model;

  @override
  Widget build(BuildContext context) {
    var color =
        model.isCorrect
            ? const Color.fromARGB(255, 8, 123, 94)
            : const Color.fromARGB(255, 237, 56, 176);
    var numberStyle = GoogleFonts.lato(
      color: const Color.fromARGB(255, 239, 233, 244),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    return CircleAvatar(
      backgroundColor: color,
      foregroundColor: Colors.yellow,
      child: Text((identifier + 1).toString(), style: numberStyle),
    );
  }
}


/*
 Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text((identifier + 1).toString(), style: numberStyle),
    );
*/