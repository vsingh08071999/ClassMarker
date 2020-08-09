import 'dart:ui';
import 'package:loginapp/provider/getAllQuestionsByTest_notifier.dart';
import 'package:loginapp/provider/getAllTestByStudent_notifier.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/screens/questionscreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

Map<int, Color> color = {};
MaterialColor mainHeading = MaterialColor(0xFFc6e3eb, color);
MaterialColor grid1Color = MaterialColor(0xFFe8997d, color);
MaterialColor grid2Color = MaterialColor(0xFF92c79f, color);
MaterialColor grid3Color = MaterialColor(0xFF9f8bbc, color);
MaterialColor grid4Color = MaterialColor(0xFFe17678, color);
MaterialColor last1Color = MaterialColor(0xFF3b86dc, color);

class _StudentDashboardState extends State<StudentDashboard> {
  _getDataFromServer() async {
    int uid = Provider.of<TeacherNotifier>(context, listen: false).user.uid;
    await Provider.of<GetAllTestByStudentNotifier>(context, listen: false)
        .getAllTestByStudent(uid);
  }

  int testid;
  _getAllQuestionsByTest() async {
    await Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false)
        .postQuestionsByTest(testid);
    _getQids();
  }

  List qidsList = [];
  List qidlist;
  var singleQid;
  _getQids() {
    var qidLength =
        Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false)
            .getAllQuestionsByTest
            .questions
            .length;

    //print("Length of Qids : $qidLength");
    for (int i = 0; i < qidLength; i++) {
      singleQid =
          Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false)
              .getAllQuestionsByTest
              .questions[i]
              .qid;
      //print(singleQid);
      qidsList.add(singleQid);
    }
    //print(qidsList);
    Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false)
        .getAllQuestionsByTest
        .listQid = qidsList;
    qidlist = Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false)
        .getAllQuestionsByTest
        .listQid;
    //print("qidList is: $qidlist");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 8,
                ),
                IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                SizedBox(
                  width: 300,
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.90,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: mainHeading,
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://pmcvariety.files.wordpress.com/2019/04/nawazuddin'
                        '-siddiqui-rexfeatures_9670910s.jpg'),
                    maxRadius: 25,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "VISHAL SINGH",
                        // 'Nawazuddin Siddique',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Delhi College of Science',
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w200),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 4,
                        width: 5,
                      ),
                      Text(
                        'B.Tech (Computer Science)',
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 33,
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        //xpadding: EdgeInsets.all(2),
                        height: 22,
                        // margin: EdgeInsets.only(bottom: 10,top: 10),
                        child: OutlineButton(
                          shape: OutlineInputBorder(),
                          onPressed: () {},
                          padding: EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '25',
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                ' Tests Assigned',
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        //xpadding: EdgeInsets.all(2),
                        height: 22,
                        // margin: EdgeInsets.only(bottom: 10,top: 10),
                        child: OutlineButton(
                          shape: OutlineInputBorder(),
                          padding: EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '40',
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '      Teammates',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 27,
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.open_in_new,
                        color: Colors.black,
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  'HELLO',
                  softWrap: true,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                Text(
                  ', Vishal!',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Expanded(
              child: Consumer<GetAllTestByStudentNotifier>(
                builder: (context, getAlltest, _) {
                  switch (getAlltest.state) {
                    case GetAllTestByStudentStatus.loading:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case GetAllTestByStudentStatus.loaded:
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.all(8),
                            child: InkWell(
                              onTap: () async {
                                testid = getAlltest.getAllTest.tests[index].id;
                                print("TestId is : $testid");
                                await _getAllQuestionsByTest();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuestionScreen(
                                              testId: testid,
                                            )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                            // 'asfdsfdsfdf',
                                            '${getAlltest.getAllTest.tests[index].name}',
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
                                            // 'sddxfcgvhbncvb',
                                            '${getAlltest.getAllTest.tests[index].descr}',
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
                                            '${getAlltest.getAllTest.tests[index].duration}',
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
                            ),
                          );
                        },
                        itemCount: getAlltest.getAllTest.tests.length,
                      );
                    default:
                      return Center(
                        child: Text(getAlltest.error),
                      );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
