import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/models/circle_image.dart';

class PostComments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PostCommentsLayout();
  }
}

class PostCommentsLayout extends State<PostComments> {
  final emailField = new TextFormField(
    decoration: new InputDecoration(
      labelText: "Enter Email",
      fillColor: Colors.white,
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(4.0),
        borderSide: new BorderSide(),
      ),
      //fillColor: Colors.green
    ),
    validator: (val) {
      if (val.length == 0) {
        return "Email cannot be empty";
      } else {
        return null;
      }
    },
    keyboardType: TextInputType.emailAddress,
    style: new TextStyle(
      fontFamily: "Poppins",
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
      Expanded(
        child: listView(),
      ),
      Row(
        children: <Widget>[
          Expanded(child: emailField),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              //do something
            },
          )
        ],
      )
    ]));
  }

  Widget listView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  CircleImage(
                    "assets/food5.jpeg",
                    imageSize: 50.0,
                    whiteMargin: 2.0,
                    imageMargin: 2.0,
                  ),
                  new Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 8.0),
                          child: Text("Title",
                              style: new TextStyle(color: Colors.black))),
                      Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
                              child: Text("Like",
                                  style: new TextStyle(color: Colors.grey))),
                          Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
                              child: Text("Reply",
                                  style: new TextStyle(color: Colors.grey))),
                        ],
                      )
                    ],
                  )
                ],
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: new Row(
                        children: <Widget>[
                          CircleImage(
                            "assets/food5.jpeg",
                            imageSize: 50.0,
                            whiteMargin: 2.0,
                            imageMargin: 2.0,
                          ),
                          new Column(
                            children: <Widget>[
                              Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 8.0),
                                  child: Text("Comment 1",
                                      style:
                                          new TextStyle(color: Colors.black))),
                            ],
                          )
                        ],
                      ));
                },
                itemCount: 4,
                shrinkWrap: true,
                // todo comment this out and check the result
                physics:
                    ClampingScrollPhysics(), // todo comment this out and check the result
              ),
            ],
          ),
        );
      },
      itemCount: 9,
    );
  }
}
