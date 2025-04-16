import 'package:adv_basic/summary/model/summary_model.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/summary/views/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<SummaryModel> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return SummaryItem(model: data);
              }).toList(),
        ),
      ),
    );
  }
}
