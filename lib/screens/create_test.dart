import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/models/model.dart';
import 'package:loginapp/provider/create_test_notifier.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:loginapp/screens/teachers_dashboard.dart';
import 'package:loginapp/widgets/create_test_textField.dart';
import 'package:provider/provider.dart';
import '../services/create_test_server.dart';

class CreateTest extends StatelessWidget {
  _alertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: Text('Test Create',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            content: Consumer<CreateTestNotifier>(
              builder: (context, createTest, _) {
                switch (createTest.state) {
                  case CreateTestStatus.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case CreateTestStatus.loaded:
                    return Text(
                      createTest.testAddModel.message,
                      style: TextStyle(fontSize: 15),
                    );
                  default:
                    return Center(
                      child: Text(createTest.error),
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

  _getDataFromServer(context) {
    int uid = Provider.of<TeacherNotifier>(context, listen: false).user.uid;
    String userid =
        Provider.of<TeacherNotifier>(context, listen: false).user.userid;
    Provider.of<CreateTestNotifier>(context, listen: false)
        .createTests(uid, userid);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: (AppBar(
          title: Text(
            "Create Test",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 5,
        )),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                createTestTextSection(context),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    onPressed: () {
                      _alertDialog(context);
                      _getDataFromServer(context);
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
