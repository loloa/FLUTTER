import 'package:adv_basic/ui/text_styles.dart';
import 'package:flutter/material.dart';

const mainColor = Color.fromARGB(255, 69, 25, 107);

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(146, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text('Learn Flutter the fun way!', style: titleStyle),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: const BorderSide(
                color: Color.fromARGB(255, 97, 47, 107),
                width: 0.5,
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
            label: const Text('Start Quiz', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
