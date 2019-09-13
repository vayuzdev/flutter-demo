import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomisedListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: ListView(
        children: <Widget>[
          ListTile(
              title: new Text("Title"),
              subtitle: new Text("Subtitle"),
              trailing: new Icon(Icons.local_activity),
              leading: new Icon(Icons.shop)),
        ],
      ),
    );
  }
}
