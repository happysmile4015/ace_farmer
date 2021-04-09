import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class UserController extends ControllerMVC {
  bool hidePassword = true;
  bool loading = false;
  GlobalKey<FormState> loginFormKey;
  GlobalKey<ScaffoldState> scaffoldKey;
  UserController() {
    loginFormKey = new GlobalKey<FormState>();
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }
}