import 'package:flutter/material.dart';

//TextEditingController uidController = new TextEditingController();
TextEditingController nameController = new TextEditingController();
TextEditingController descController = new TextEditingController();
Container addGroupTextSection() {
  return Container(
    child: Column(
      children: <Widget>[
        //text('Uid', uidController),
        text('Name', nameController),
        text('Description', descController),
      ],
    ),
  );
}

Widget text(String name, controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Container(
          width: 250,
          //width: MediaQuery.of(context).size.width * 0.60,
          //height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(width: 2, color: Colors.black)),
          child: TextField(
            controller: controller,
            onTap: () {},
            style: TextStyle(fontSize: 23),
            // maxLines: _line,
          ),
        )
      ],
    ),
  );
}
