import 'package:flutter/material.dart';
import 'package:loginapp/provider/submit_test_notifier.dart';
import 'package:provider/provider.dart';

class StudentScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Score',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Consumer<SubmitTestNotifier>(
          builder: (context, submitTest, _) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                "Your total score is : ${submitTest.submitTestModel.score.toString()}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35),
              ),
            );
          },
        ),
      ),
    );
  }
}
