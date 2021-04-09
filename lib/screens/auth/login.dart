import 'package:ace_farmer/controllers/user_controller.dart';
import 'package:ace_farmer/elements/BlockButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


import '../../helpers/app_config.dart' as config;

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends StateMVC<LoginWidget> {
  UserController _con;

  _LoginWidgetState() : super(UserController()) {
    _con = controller;
  }
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              width: config.App(context).appWidth(100),
              height: config.App(context).appHeight(37),
              decoration: BoxDecoration(color: Theme.of(context).accentColor),
            ),
          ),
          Positioned(
            top: config.App(context).appHeight(37) - 120,
            child: Container(
              width: config.App(context).appWidth(84),
              height: config.App(context).appHeight(37),
              child: Text(
                'Let\'s Start with Login!',
                style: Theme.of(context).textTheme.headline2.merge(TextStyle(color: Theme.of(context).secondaryHeaderColor)),
              ),
            ),
          ),
          Positioned(
            top: config.App(context).appHeight(37) - 50,
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  color: Theme.of(context).hintColor.withOpacity(0.2),
                )
              ]),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: EdgeInsets.only(top: 50, right: 27, left: 27, bottom: 20),
              width: config.App(context).appWidth(88),
//              height: config.App(context).appHeight(55),
              child: Form(
                key: _con.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) => !input.contains('@') ? 'Should be a valid email' : null,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Theme.of(context).accentColor),
                        contentPadding: EdgeInsets.all(12),
                        hintText: 'johndoe@gmail.com',
                        hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                        prefixIcon: Icon(Icons.alternate_email, color: Theme.of(context).accentColor),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (input) => input.length < 3 ? 'Should be more than 3 characters' : null,
                      obscureText: _con.hidePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Theme.of(context).accentColor),
                        contentPadding: EdgeInsets.all(12),
                        hintText: '••••••••••••',
                        hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                        prefixIcon: Icon(Icons.lock_outline, color: Theme.of(context).accentColor),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _con.hidePassword = !_con.hidePassword;
                            });
                          },
                          color: Theme.of(context).focusColor,
                          icon: Icon(_con.hidePassword ? Icons.visibility : Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      ),
                    ),
                    SizedBox(height: 30),
                    BlockButtonWidget(
                      text: Text(
                        'Login',
                        style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
                      ),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/Dashboard');
                      },
                    ),
                    SizedBox(height: 15),
                    FlatButton(
                      onPressed: () {
                        // Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
                      },
                      shape: StadiumBorder(),
                      textColor: Theme.of(context).hintColor,
                      child: Text('Skip'),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    ),
//                      SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/ForgetPassword');
                  },
                  textColor: Theme.of(context).hintColor,
                  child: Text('I forgot password ?'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/SignUp');
                  },
                  textColor: Theme.of(context).hintColor,
                  child: Text('I don\'t have an account?'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
