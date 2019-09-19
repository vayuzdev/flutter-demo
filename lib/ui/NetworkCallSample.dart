import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/network/blocs/feed.dart';
import 'package:social/network/models/item_model.dart';

class NetworkCallSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _NetworkCallSample();
  }
}

class _NetworkCallSample extends State<NetworkCallSample> {
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
    feedListingBloc.fetchFeedDetails();
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("App"),
        ),
        body: new Container(
            child: StreamBuilder(
          stream: feedListingBloc.movieList,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            if (snapshot.hasData) {
              return buildContent(snapshot, context);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return Container(
                padding: EdgeInsets.all(20.0),
                child: Center(child: CircularProgressIndicator()));
          },
        )));
  }

  Widget buildContent(AsyncSnapshot<ItemModel> snapshot, BuildContext context) {
    return new ListView.builder(
        itemBuilder: (context, item) {
          return new Card(
            child: new Column(
              children: <Widget>[
                new Text(snapshot.data.feedDetails[item].template),
                new Row(children: <Widget>[
                  IconButton(
                      icon: Icon(snapshot.data.feedDetails[item].post_liked? Icons.accessibility: Icons.message),
                      onPressed: () => Navigator.of(context).pop())
                ],)
              ],
            ),
            elevation: 8.0,
          );
        },
        itemCount: snapshot.data.feedDetails.length);
  }
}
