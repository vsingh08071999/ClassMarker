import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController usertxt = new TextEditingController();
TextEditingController passwordtxt = new TextEditingController();

Container loginTextSection() {
  return Container(
    //padding: EdgeInsets.all(15),
    child: Column(
      children: <Widget>[
        txtUsername("Username", usertxt),
        SizedBox(
          height: 20,
        ),
        txtPassword("Password", passwordtxt),
      ],
    ),
  );
}

Widget txtUsername(String title, control) {
  return TextFormField(
    controller: control,
    style: TextStyle(fontSize: 20, color: Colors.white),
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.person,
        color: Colors.white,
      ),
      fillColor: Colors.black.withOpacity(0.3),
      filled: true,
      border: InputBorder.none,
      hintText: title,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.white, width: 1.7)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(width: 1.7, color: Colors.white)),
      hintStyle: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

Widget txtPassword(String title, control) {
  return TextFormField(
    obscureText: true,
    controller: control,
    style: TextStyle(fontSize: 20, color: Colors.white),
    decoration: InputDecoration(
      fillColor: Colors.black.withOpacity(0.3),
      filled: true,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.white, width: 1.7)),
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.white, width: 1.7)),
      prefixIcon: Icon(
        Icons.lock_open,
        color: Colors.white,
      ),
      hintText: title,
      hintStyle: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}
