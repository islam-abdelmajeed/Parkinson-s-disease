import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class AppToasts {
  static Future<bool?> success({required final String msg}) async =>
      await Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

  static Future<bool?> error({required final String msg}) async =>
      await Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

  static Future<bool?> hint({required final String msg}) async =>
      await Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
}
