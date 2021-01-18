import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  AnswerCard({@required this.answer});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(answer),
    );
  }
}
