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
    var month = DateTime.now().toString();
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
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                          children: [
                            Text(
                              data['currencyType'] + " ",
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
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_up_rounded,
                            color: CONSTANTS.primary,
                            size: 20,
                          ),
                          Container(
                            child: Text(
                              " " + data['experience'] + "%",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: CONSTANTS.smallSize.toDouble()
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: config.App(context).appHeight(42) - 80,
            child: Container(
              height: 80,
              width: config.App(context).appWidth(100),
              decoration: BoxDecoration(
                  color: CONSTANTS.transparentBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Exchange Update',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    Text(
                      month
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}