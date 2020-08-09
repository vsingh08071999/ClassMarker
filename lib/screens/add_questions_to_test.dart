import 'package:flutter/material.dart';
import 'package:loginapp/provider/add_question_test_notifier.dart';
import 'package:loginapp/provider/view_question_notifier.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:loginapp/screens/teachers_dashboard.dart';
import 'package:loginapp/services/add_questions_to_test_server.dart';
import 'package:provider/provider.dart';

class AddQuestionsToTest extends StatefulWidget {
  @override
  _AddQuestionsToTestState createState() => _AddQuestionsToTestState();
}

class _AddQuestionsToTestState extends State<AddQuestionsToTest> {
  var selectedValue;
  var questionId;
  List qIds = [];
  getQuestionId() {
    qIds.add(questionId);
  }

  var testId;
  _postDataToServer() {
    Provider.of<AddQuestionToTestNotifier>(context, listen: false)
        .addQuestionTestNotifier(testId, qIds);
  }

  _alertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: Text('Add Questions To Test',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            content: Consumer<AddQuestionToTestNotifier>(
              builder: (context, addQuestionsToTestNotifier, _) {
                switch (addQuestionsToTestNotifier.state) {
                  case AddQuestionToTestStatus.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case AddQuestionToTestStatus.loaded:
                    return Text(
                      addQuestionsToTestNotifier.addQuestionTestModel.message,
                      style: TextStyle(fontSize: 15),
                    );
                  default:
                    return Center(
                      child: Text(addQuestionsToTestNotifier.error),
                    );
                }
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => TeacherDashBoard()));
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AddQuestionsToTest',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.96,
            decoration: BoxDecoration(
                border: Border.all(width: 1.2, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Consumer<UserNotifier>(
              builder: (context, userNotifier, _) {
                return DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        size: 40,
                      ),
                      dropdownColor: Colors.white,
                      elevation: 5,
                      hint: Text(
                        'Tests',
                        style: TextStyle(fontSize: 22),
                      ),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                          print(selectedValue);
                        });
                      },
                      items: userNotifier.testModel.tests
                          .map((var singleItem) => DropdownMenuItem(
                                child: InkWell(
                                  onTap: () {
                                    testId = singleItem.id;
                                    print(testId);
                                  },
                                  child: Container(
                                    color: Colors.grey,
                                    padding: EdgeInsets.only(top: 7),
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width: MediaQuery.of(context).size.width *
                                        0.68,
                                    child: Text(
                                      singleItem.name,
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                                value: singleItem.name.toString(),
                              ))
                          .toList(),
                    ),
                  ),
                );
              },
            ),
            // color: Colors.red,
          ),
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(top: 8),
              child: Consumer<ViewQuestionNotfier>(
                builder: (context, viewQuestionNotifier, _) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                        elevation: 3,
                        child: InkWell(
                          onTap: () {
                            questionId = viewQuestionNotifier
                                .questionModel.questions[index].qid;
                            getQuestionId();
                            print(qIds);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Q : ",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                ),
                                Expanded(
                                  child: Text(
                                    viewQuestionNotifier
                                        .questionModel.questions[index].name,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    itemCount:
                        viewQuestionNotifier.questionModel.questions.length,
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RaisedButton(
              onPressed: () {
                _postDataToServer();
                _alertDialog(context);
              },
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Colors.red,
            ),
          )
        ]),
      ),
    );
  }
}
