import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/network/blocs/feed_detail.dart';
import 'package:social/network/models/item_model.dart';

class NetworkCallSample2 extends StatefulWidget {
  String postedQuestionId;

  NetworkCallSample2(String postedQuestionID) {
    this.postedQuestionId = postedQuestionID;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _NetworkCallSample2();
  }
}

class _NetworkCallSample2 extends State<NetworkCallSample2> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    feedDetailBloc.fetchFeedDetailBasedOnId(widget.postedQuestionId);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("App 2"),
        ),
        body: new Container(
            child: StreamBuilder(
          stream: feedDetailBloc.postDetail,
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
                new Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(snapshot.data.feedDetails[item].post_liked
                            ? Icons.thumb_down
                            : Icons.thumb_up),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
//                          eventBus.on<LikeEvent>().listen((event) {
                          // All events are of type UserLoggedInEvent (or subtypes of it).
//                            Fluttertoast.showToast(
//                                msg: "Send",
//                                toastLength: Toast.LENGTH_SHORT,
//                                gravity: ToastGravity.CENTER,
//                                timeInSecForIos: 1,
//                                backgroundColor: Colors.red,
//                                textColor: Colors.white,
//                                fontSize: 16.0);
//                          });
//                          LikeEvent likeEvent = new LikeEvent(snapshot.data.feedDetails[item].postedQuestionId,!snapshot.data.feedDetails[item].post_liked);
//                          eventBus.fire(likeEvent);

//                        })
                        }),
                    Visibility(
                      child: new CircularProgressIndicator(),
                      visible: isVisible,
                    ),
                  ],
                )
              ],
            ),
            elevation: 8.0,
          );
        },
        itemCount: snapshot.data.feedDetails.length);
  }
}
