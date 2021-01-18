// ignore: unused_import
import 'dart:convert';
import 'package:flutter/material.dart';
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
    return rawJson;
  }

  @override
  void initState() {
    super.initState();
    var data = fetchJsonData();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {},
        ),
      ),
    );
  }
}

/*
 * FutureBuilder(
        builder: (context, snapshot) {
          var myData = jsonDecode(snapshot.data.toString());
          return ListView.builder(
            itemBuilder: (context, index) {
              print(myData);
              return Text(myData[index].answers);
            },
          );
        },
        future: DefaultAssetBundle.of(context).loadString('Data/bd.json'),
      )
 * 
 */

/*Future loadData() async {
    String jsonString = await fetchJsonData();
    final jsonResponse = jsonDecode(jsonString);
    Users answer = new Users.fromJson(jsonResponse);
    print(answer);
  } */
/*
  Future<List<Answer>> fetchAnswers(var rawJson) async {
    final parsed = jsonDecode(rawJson).cast<Map<String, dynamic>>();
    return parsed.map<Answer>((json) => Answer.fromJson(json)).toList();
  }*/
