import 'package:flutter/material.dart';
import 'package:loginapp/models/test_view_model.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:provider/provider.dart';

class ViewTest extends StatefulWidget {
  @override
  _ViewTestState createState() => _ViewTestState();
}

class _ViewTestState extends State<ViewTest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 5,
          title: Text(
            'View Test',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Consumer<UserNotifier>(
              builder: (context, userNotifier, _) {
                switch (userNotifier.state) {
                  case ViewTestStatusNotifier.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ViewTestStatusNotifier.loaded:
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'Name : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        // 'Name :',
                                        '${userNotifier.testModel.tests[index].name}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'Description : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        // 'Name :',
                                        '${userNotifier.testModel.tests[index].descr}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'Duration : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        // 'Name :',
                                        '${userNotifier.testModel.tests[index].duration}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'Passing Score : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        // 'Name :',
                                        '${userNotifier.testModel.tests[index].passingScore}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: userNotifier.testModel.tests.length,
                    );
                  default:
                    return Center(
                      child: Text(userNotifier.error),
                    );
                }
              },
            )),
      ),
    );
  }
}
