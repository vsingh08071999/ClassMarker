import 'package:flutter/material.dart';
import 'package:loginapp/provider/add_question_notifier.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/screens/teachers_dashboard.dart';
import 'package:loginapp/widgets/add_question_textField.dart';
import 'package:provider/provider.dart';

class AddQuestion extends StatelessWidget {
  _answerText(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        Text(
          'Description',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        Text(
          'Right Answer',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _alertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: Text('Add Question',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            content: Consumer<AddQuestionNotifier>(
              builder: (context, addQuestionNotifier, _) {
                switch (addQuestionNotifier.state) {
                  case AddQuestionStatus.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case AddQuestionStatus.loaded:
                    return Text(
                      addQuestionNotifier.addQuestionModel.message,
                      style: TextStyle(fontSize: 15),
                    );
                  default:
                    return Center(
                      child: Text(addQuestionNotifier.error),
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

  _postDataToServer(context) {
    int uid = Provider.of<TeacherNotifier>(context, listen: false).user.uid;
    Provider.of<AddQuestionNotifier>(context, listen: false).addQuestions(uid);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Question',
            // user.rights[4].createGroup,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 5,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                addQuestionTextSection1(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Answer :',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                _answerText(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                addQuestionTextSection2(context),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    onPressed: () {
                      _alertDialog(context);
                      _postDataToServer(context);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
