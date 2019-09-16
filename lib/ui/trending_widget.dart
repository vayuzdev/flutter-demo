import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social/ui/filtered_video_section.dart';
import 'package:social/ui/restaurants.dart';
import 'package:social/ui/story.dart';
import 'package:social/ui/trending_item.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(1.0, 0, 1.0, 0),
        child: ListView(
          children: <Widget>[
            homeHeader(),
            new Container(
                child: new Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    "Stories",
                    textAlign: TextAlign.left,
                    style: new TextStyle(fontSize: 18),
                  ),
                ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    "See All",
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            )),
            Story(),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              itemCount: restaurants == null ? 0 : restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                Map restaurant = restaurants[index];

                return TrendingItem(
                  img: restaurant["img"],
                  title: restaurant["title"],
                  address: restaurant["address"],
                  rating: restaurant["rating"],
                );
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget searchHeader() {
    return Card(
      elevation: 6.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "Search..",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            suffixIcon: Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
            hintStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          maxLines: 1,
          controller: _searchControl,
        ),
      ),
    );
  }

  Widget homeHeader() {
    return Container(
      margin: EdgeInsets.only(top: 4),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: IconButton(
              icon: Icon(Icons.supervised_user_circle),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Home",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FilteredVideoSection()),
                  );
                },
                child: Text(
                  "Video",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text("Audio",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text("Story",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
