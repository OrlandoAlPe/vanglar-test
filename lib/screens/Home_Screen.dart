import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pruebaVanglar/models/automodel.dart';
import 'package:pruebaVanglar/models/users.dart';
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
    // itemList.forEach((item) {
    // print(item.answer);
    // print(item.userId);
    //});
    return itemList;
  }

  List<Answer> allAnswers = List();
  List<Answer> myAnswers = List();
  List<String> myUsers = UsersList.users;

  bool loading = false;
  String uidFilter;
  @override
  void initState() {
    getAnswers();

    super.initState();
  }

  getAnswers() {
    fetchJsonData().then((response) {
      setState(() {
        allAnswers = response;
        myAnswers = customAnswer(
          allAnswers,
          'UserId.Q_UB_CB_EV4_BARZ84_PIV_UB_CZ5_GH_R_ZP2',
        );

        loading = true;
      });
    });
  }

  customAnswer(List<Answer> allAnswers, String uid) {
    List<Answer> customList = List();
    for (var i = 0; i < allAnswers.length; i++) {
      if (allAnswers[i].userId.toString() == uid) {
        customList.add(
          new Answer(
            answer: allAnswers[i].answer,
            userId: allAnswers[i].userId,
          ),
        );
      }
    }
    return customList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton(
            icon: Icon(Icons.search),
            hint: Text(
              'Filter by UID',
              style: TextStyle(color: Colors.white),
            ),
            items: myUsers.map((e) {
              return DropdownMenuItem(
                child: Text('Alumno ${myUsers.indexOf(e)+1}'),
                value: e,
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                myAnswers = customAnswer(allAnswers, newValue);
              });
            },
          ),
        ],
        title: Text(loading ? 'Answers' : 'Loading...'),
      ),
      body: loading
          ? Center(
              child: ListView.builder(
                itemCount: myAnswers.length,
                itemBuilder: (context, index) {
                  return AnswerCard(
                    answer: myAnswers[index].answer.toString(),
                    uid: myAnswers[index].userId.toString(),
                  );
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
