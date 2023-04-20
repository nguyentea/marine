import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class EmptyPage extends StatefulWidget {
  @override
  _EmptyPageState createState() => new _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Demo login"),
      ),
      body: Container(
        child: Text("Đăng nhập thành công!"),
      ),
    );

  }

}
