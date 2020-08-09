import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: () {
              getQuestion();
            },
            child: Text('pressed'),
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  getQuestion() async {
    String url =
        'http://3e228998e398.ngrok.io/testenginedemo/getAllQuestionsByUser/1';
    var response = await http.get(url);
    print(response);
    var jsonData;
    print('StatusCode ${response.statusCode}');
    jsonData = jsonDecode(response.body);
    print(response.statusCode);
    print('Questions are : $jsonData');
//    if (response.statusCode == 200) {
//      print(response.statusCode);
//      jsonData = json.jsonDecode(response.body);
//      print('Questions are : $jsonData');
//      // QuestionsModel questionModel = QuestionsModel.fromJson(jsonData);
//      // return QuestionsModel.fromJson(jsonData);
//      return jsonData;
  }
//    else
//      throw "Something Went Wrong ${response.statusCode}";
}
