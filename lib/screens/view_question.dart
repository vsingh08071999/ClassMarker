import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginapp/models/model.dart';
import 'package:loginapp/models/question_view_model.dart';
import 'package:loginapp/provider/view_question_notifier.dart';
import 'package:provider/provider.dart';

class ViewQuestion extends StatefulWidget {
  @override
  _ViewQuestionState createState() => _ViewQuestionState();
}

class _ViewQuestionState extends State<ViewQuestion> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 5,
          title: Text(
            'View Question',
            // user.rights[18].createTest,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ViewQuestionNotfier>(
              builder: (context, viewQuestionNotfier, _) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Q : ",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                              Expanded(
                                child: Text(
                                  viewQuestionNotfier
                                      .questionModel.questions[index].name,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemBuilder: (context, i) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '${viewQuestionNotfier.questionModel.questions[index].answers[i].name}. ',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Expanded(
                                    child: Text(
                                      viewQuestionNotfier.questionModel
                                          .questions[index].answers[i].descr,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              );
                            },
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: viewQuestionNotfier
                                .questionModel.questions[index].answers.length,
                          )
                        ],
                      ),
                    ));
              },
              itemCount: viewQuestionNotfier.questionModel.questions.length,
            );
          }),
        ),
      ),
    );
  }
}
