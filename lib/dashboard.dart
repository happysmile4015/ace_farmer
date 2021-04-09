import 'package:ace_farmer/screens/home/index.dart';
import 'package:ace_farmer/screens/market/index.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'helpers/constants.dart' as CONSTANTS;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List pages = [
    MyRoute(
      iconData: Icons.home_filled,
      title: 'Home',
      page: Home(),
    ),
    MyRoute(
      iconData: Icons.shopping_bag,
      title: 'Market',
      page: Market(),
    ),
    MyRoute(
      iconData: Icons.add,
      title: 'Farm',
      page: Home(),
    ),
    MyRoute(
      iconData: Icons.phone_android_sharp,
      title: 'Blog',
      page: Home(),
    ),
    MyRoute(
      iconData: Icons.person_rounded,
      title: 'Profile',
      page: Home(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: CONSTANTS.background,
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: pages[_page].page,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60,
        items:
        pages.asMap().entries.map((entry) {
          var p = entry.value;
          return Container(
            margin: EdgeInsets.only(top: 17),
            child: Column(
              children: [
                Icon(
                  p.iconData,
                  size: _page == entry.key ? 20 : 30,
                  color: _page == entry.key ? Colors.white : Colors.grey,
                ),
                Text(
                  p.title,
                  style: TextStyle(
                      color: _page == entry.key ? Colors.white : Colors.grey,
                      fontSize: _page == entry.key ? 16 : 20
                  ),
                )
              ],
            ),
          );
        }
        ).toList(),
        color: Colors.white,
        buttonBackgroundColor: CONSTANTS.primary,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      drawer: Container(
        child: Icon(Icons.add),
      ),
    );
  }
}
class MyRoute {
  final IconData iconData;
  final String title;
  final Widget page;

  MyRoute({this.iconData, this.title, this.page});
}
