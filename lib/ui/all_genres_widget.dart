import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllGenresWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.85),
      body: new Container(
        child: ListView(
          children: <Widget>[
            ListTile(title: new Text("Title"), leading: new Icon(Icons.shop)),
            ListTile(title: new Text("Title"), leading: new Icon(Icons.shop)),
            ListTile(title: new Text("Title"), leading: new Icon(Icons.shop)),
            ListTile(title: new Text("Title"), leading: new Icon(Icons.shop)),
            ListTile(title: new Text("Title"), leading: new Icon(Icons.shop)),
            ListTile(title: new Text("Title"), leading: new Icon(Icons.shop)),
            ListTile(title: new Text("Title"), leading: new Icon(Icons.shop)),
            ListTile(title: new Text("Title"), leading: new Icon(Icons.shop)),
          ],
        ),
      ),
    );
  }
}
