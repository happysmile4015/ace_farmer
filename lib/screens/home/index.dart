import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../helpers/app_config.dart' as config;

import '../../helpers/constants.dart' as CONSTANTS;

class Home extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends StateMVC<Home> {
  var loaded = false;
  var data = {
    "currencyType" : '',
    "currencyPoint" : '',
    "experience" : ''
  };

  @override
  void initState() {
    super.initState();

    asyncMethod();
  }

  void asyncMethod() async {
    var response = {
      "currencyType" : 'RM',
      "currencyPoint" : '108.21',
      "experience" : '8.6'
    };
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CONSTANTS.background,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: config.App(context).appWidth(100),
              height: config.App(context).appHeight(42),
              decoration: BoxDecoration(color: CONSTANTS.primary),
            ),
          ),
          Positioned(
            top: config.App(context).appHeight(42) - config.App(context).appHeight(30),
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Portfolio Value",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: CONSTANTS.smallSize.toDouble()
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          data['currencyType'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: CONSTANTS.mediumSize.toDouble(),
                          ),
                        ),
                        Text(
                          data['currencyPoint'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: CONSTANTS.mediumSize.toDouble(),
                          ),
                        )
                      ]
                    ),
                    Text(
                      "afasd",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: CONSTANTS.mediumSize.toDouble()
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: config.App(context).appHeight(42) - 70,
            child: Container(
              height: 70,
              width: config.App(context).appWidth(100),
              decoration: BoxDecoration(
                color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}