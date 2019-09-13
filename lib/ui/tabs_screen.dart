import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social/ui/story_box.dart';

import 'customised_list_view.dart';

class TabBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabBarDemo();
  }
}

class _TabBarDemo extends State<TabBarDemo> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CustomisedListView(),
    StoryBox(),
    PlaceholderWidget(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tabs Demo'),
          ),
          body: _children[_currentIndex], // new
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.mail),
                title: new Text('Messages'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Profile'))
            ],
          ),
        ),
      ),
    );
    ;
  }

  void onTabTapped(int value) {
    setState(() {
      _currentIndex = value;
    });
    Fluttertoast.showToast(
        msg: "{$value}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
