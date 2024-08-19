import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';

class QuizBrain {
  List<Question> questionstore = [
    Question(question: 'are you a boy ?',answer: true),
    Question(question: 'are you gay ?',answer: true),
    Question(question: 'do you want to have a date ?',answer: true),
  ];

  List<Question> questionBank = [];

  String name = '';

  Widget createText(String word, double size) {
    return Text(
      word,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: Colors.white,
      ),
    );
  }
}