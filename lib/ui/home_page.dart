import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/ui/tabs_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageSection(),
    );
  }
}

class HomePageSection extends StatefulWidget {
  HomePageSection({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecondScreenPageState createState() => _SecondScreenPageState();
}

class _SecondScreenPageState extends State<HomePageSection> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Home Page"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop())),
        body: Container(
          child: new Center(
              child: new RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TabBarDemo()),
              );

              ///this context is passed from firstScreen
            },
            child: new Text('Go To Tabs'),
          )),
        ));
  }
}
