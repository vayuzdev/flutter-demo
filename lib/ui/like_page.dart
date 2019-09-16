import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/models/circle_image.dart';

class LikePageListing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LikePage();
  }
}

class LikePage extends State<LikePageListing> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: new ListView.builder(
      itemBuilder: (context, item) {
        return new Container(
            child: Card(
          child: new Row(
            children: <Widget>[
              CircleImage(
                "assets/food5.jpeg",
                imageSize: 72.0,
                whiteMargin: 2.0,
                imageMargin: 2.0,
              ),
              new Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 8.0),
                      child: Text("Title",
                          style: new TextStyle(color: Colors.black))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
                      child: Text("Subtitle",
                          style: new TextStyle(color: Colors.grey))),
                ],
              )
            ],
          ),
        ));
      },
      itemCount: 10,
    ));
  }
}
