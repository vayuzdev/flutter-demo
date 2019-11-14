import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social/event_bus/event_bus_obj.dart';
import 'package:social/event_bus/like_event.dart';
import 'package:social/network/blocs/feed.dart';
import 'package:social/network/models/item_model.dart';
import 'package:social/ui/network_call_sample_page2.dart';

import 'NetworkCallSample.dart';

class NetworkCallSampleState extends State<NetworkCallSample> {
  AsyncSnapshot<ItemModel> snapshot;

  @override
  void initState() {
    feedListingBloc.fetchFeedDetails();
    createSubs();

    eventBus.on<LikeEvent>()
        .listen((event) {
      String postId = event.postId;
      setState(() {
        var flag = -1;
        for (var i = 0; i < snapshot.data.feedDetails.length; i++) {
          if (snapshot.data.feedDetails[i].postedQuestionId == postId) {
            flag = i;
            break;
          }
        }
        if (flag != -1) {
          snapshot.data.feedDetails[flag].post_liked =
              event.b;
        }
      });
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose

    feedListingBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
    this.snapshot = snapshot;
    return new ListView.builder(
        itemBuilder: (context, item) {
          return new Card(
            child: new Column(
              children: <Widget>[
                new GestureDetector(
                  child: new Text(snapshot.data.feedDetails[item].template),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NetworkCallSample2(snapshot
                              .data.feedDetails[item].postedQuestionId)),
                    );
                  },
                ),
                new Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(snapshot.data.feedDetails[item].post_liked
                            ? Icons.thumb_down
                            : Icons.thumb_up),
                        onPressed: () => setState(() {
                              snapshot.data.feedDetails[item].post_liked =
                                  !snapshot.data.feedDetails[item].post_liked;
                            }))
                  ],
                )
              ],
            ),
            elevation: 8.0,
          );
        },
        itemCount: snapshot.data.feedDetails.length);
  }

  makeActivePage() {
    new Future.delayed(Duration(seconds: 3)).then((_) {
      Fluttertoast.showToast(
          msg: "This is Center Short Toast",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
//      setState(() {
//        snapshot.data.feedDetails[1].post_liked = !snapshot.data.feedDetails[1].post_liked;
//      });
    });
  }

  void createSubs() {}
}
