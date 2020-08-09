import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/models/model.dart';
import 'package:loginapp/provider/add_group_notifier.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/screens/teachers_dashboard.dart';
import 'package:loginapp/services/addGroup_server.dart';
import 'package:loginapp/widgets/add_group_textfield.dart';
import 'package:provider/provider.dart';

class CreateGroup extends StatelessWidget {
  _alertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Consumer<AddGroupNotifier>(
                builder: (context, addGroupNotifier, _) {
                  switch (addGroupNotifier.state) {
                    case AddGroupStatus.loading:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case AddGroupStatus.loaded:
                      return Text(addGroupNotifier.groupAddModel.message);
                    default:
                      return Center(
                        child: Text(addGroupNotifier.error),
                      );
                  }
                },
              ),
              title: Text('Create Group',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeacherDashBoard()));
                  },
                  child: Text('Ok'),
                )
              ],
            ));
  }

  _postDataToServer(context) {
    int uid = Provider.of<TeacherNotifier>(context, listen: false).user.uid;
    Provider.of<AddGroupNotifier>(context, listen: false).postGroup(uid);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 5,
          title: Text(
            'Create Group',
            //user.rights[20].createTest,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Column(
              children: <Widget>[
                addGroupTextSection(),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    onPressed: () {
                      _postDataToServer(context);
                      _alertDialog(context);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.red,
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
