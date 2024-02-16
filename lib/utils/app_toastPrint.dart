import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastController{
  static flutterToastController(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white// Also possible "TOP" and "CENTER"
    );
  }
}