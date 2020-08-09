import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TextEditingController uidCon = TextEditingController();
TextEditingController nameCon = TextEditingController();
TextEditingController scoreCon = TextEditingController();
TextEditingController n1 = TextEditingController();
TextEditingController n2 = TextEditingController();
TextEditingController n3 = TextEditingController();
TextEditingController n4 = TextEditingController();
TextEditingController d1 = TextEditingController();
TextEditingController d2 = TextEditingController();
TextEditingController d3 = TextEditingController();
TextEditingController d4 = TextEditingController();
TextEditingController a1 = TextEditingController();
TextEditingController a2 = TextEditingController();
TextEditingController a3 = TextEditingController();
TextEditingController a4 = TextEditingController();
Container addQuestionTextSection1(context) {
  return Container(
      child: Column(
    children: <Widget>[
      //   text('Uid', context, uidCon),
      text('Name', context, nameCon),
      text('Score', context, scoreCon),
    ],
  ));
}

Container addQuestionTextSection2(context) {
  return Container(
    child: Column(
      children: <Widget>[
        answerContainer(context, n1, d1, a1),
        answerContainer(context, n2, d2, a2),
        answerContainer(context, n3, d3, a3),
        answerContainer(context, n4, d4, a4),
      ],
    ),
  );
}

Widget text(name, context, controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.black, width: 2),
          ),
          width: MediaQuery.of(context).size.width * 0.70,
          child: TextFormField(
            style: TextStyle(fontSize: 22),
            controller: controller,
            onTap: () {},
          ),
        )
      ],
    ),
  );
}

Widget answerContainer(context, controller1, controller2, controller3) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          //margin: EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width * 0.20,
          child: TextField(
            style: TextStyle(
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
            controller: controller1,
            decoration: InputDecoration(
              hintText: 'option',
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          margin: EdgeInsets.symmetric(horizontal: 2),
          width: MediaQuery.of(context).size.width * 0.55,
          child: TextField(
            style: TextStyle(
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
            controller: controller2,
            decoration: InputDecoration(
              hintText: 'description',
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          //margin: EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width * 0.20,
          child: TextField(
            controller: controller3,
            decoration: InputDecoration(hintText: 'Y/N'),
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
