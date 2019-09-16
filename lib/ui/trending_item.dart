import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social/models/circle_image.dart';

class TrendingItem extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String rating;

  TrendingItem({
    Key key,
    @required this.img,
    @required this.title,
    @required this.address,
    @required this.rating,
  }) : super(key: key);

  @override
  _TrendingItemState createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: new Column(
                    children: <Widget>[
                      userInfoRow(),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: Image.asset(
                          "${widget.img}",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  top: 100,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 160.0,
                          child: Container(
                              child: new Column(
                            children: <Widget>[
                              new Padding(
                                padding:
                                    EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
                                child: Icon(
                                  FontAwesomeIcons.heart,
                                  size: 24,
                                ),
                              ),
                              new Padding(
                                padding:
                                    EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
                                child: Icon(
                                  FontAwesomeIcons.comment,
                                  size: 24,
                                ),
                              ),
                              new Padding(
                                padding:
                                    EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
                                child: Icon(
                                  Icons.share,
                                  size: 24,
                                ),
                              ),
                            ],
                          )),
                        ),
                      )),
                ),
                Positioned.fill(
                  top: 70,
                  child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 55.0,
                          child: Container(
                            height: 55.0,
                            child: Image.asset(
                              "assets/play.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )),
                )
              ],
            ),
            SizedBox(height: 7.0),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: new Row(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                            size: 18,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Text(
                              "Delhi",
                              textAlign: TextAlign.left,
                              style: new TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          "2m",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 7.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "A folklore genre that typically consists of a story passed down from generation to generation orally",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget userInfoRow() => Row(
        children: <Widget>[
          CircleImage(
            "assets/food5.jpeg",
            imageSize: 36.0,
            whiteMargin: 2.0,
            imageMargin: 6.0,
          ),
          Text('_mark_official_'),
          Expanded(child: SizedBox()),
          new Container(
            child: new Text (
                "Romantic",
                style: new TextStyle(
                    color: Colors.grey
                )
            ),
            decoration: new BoxDecoration (
                borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
                color: Colors.transparent,
                border: Border.all(color: Colors.blueAccent)
            ),
            padding: new EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      );
}
