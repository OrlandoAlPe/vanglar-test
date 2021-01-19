import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final String uid;
  AnswerCard({@required this.answer, @required this.uid});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Card(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          child: Column(
            children: [
              Text(
                'Answer: $answer',
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$uid',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 10, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
