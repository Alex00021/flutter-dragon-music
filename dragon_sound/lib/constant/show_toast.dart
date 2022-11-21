import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///弹出提示框
class ShowToast {
  static show(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.grey[400],
      fontSize: 16.0,
    );
  }
}
/// 使用方法
/// ShowToast.show("msg");