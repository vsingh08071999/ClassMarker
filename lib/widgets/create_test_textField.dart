import 'package:flutter/material.dart';

TextEditingController name = new TextEditingController();
TextEditingController desc = new TextEditingController();
TextEditingController attempts = new TextEditingController();
TextEditingController duration = new TextEditingController();
TextEditingController score = new TextEditingController();
//TextEditingController createdBy = new TextEditingController();
//TextEditingController uid = new TextEditingController();
Container createTestTextSection(context) {
  return Container(
    child: Column(
      children: <Widget>[
        text('Name', context, name),
        text('Description', context, desc),
        text('No. of Attempts', context, attempts),
        text('Duration', context, duration),
        text('Passing Score', context, score),
        //text('Created by', context, createdBy),
        //      text('Uid', context, uid),
      ],
    ),
  );
}

Widget text(String name, context, controller, [_width]) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.black, width: 2),
          ),
          width: MediaQuery.of(context).size.width * 0.50,
          child: TextFormField(
            controller: controller,
            onTap: () {},
          ),
        )
      ],
    ),
  );
}
