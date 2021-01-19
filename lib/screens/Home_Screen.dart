// ignore: unused_import
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pruebaVanglar/models/automodel.dart';
// ignore: unused_import
import 'package:pruebaVanglar/widgets/Answer_Card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future fetchJsonData() async {
    var rawJson =
        await DefaultAssetBundle.of(context).loadString('Data/bd.json');

    Map mapValue = json.decode(rawJson)["answers"];

    List<Answer> itemList = List();
    mapValue.forEach((key, item) {
      itemList.add(new Answer.fromJson(item));
    });

    /*itemList.forEach((item) {
      print(item.answer);
      print(item.userId);
    });*/
    return itemList;
  }

  List<Answer> myAnswers = List();

  @override
  void initState() {
    getAnswers();
    super.initState();
  }

  getAnswers() {
    fetchJsonData().then((response) {
      setState(() {
        myAnswers = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: myAnswers.length,
          itemBuilder: (context, index) {
            return AnswerCard(
              answer: myAnswers[index].answer.toString(),
            );
          },
        ),
      ),
    );
  }
}
