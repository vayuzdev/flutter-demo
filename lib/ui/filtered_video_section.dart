import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social/ui/restaurants.dart';
import 'package:social/ui/trending_item.dart';

import 'all_genres_widget.dart';

class FilteredVideoSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FilteredVideo();
  }
}

class _FilteredVideo extends State<FilteredVideoSection> {
  final TextEditingController _searchControl = new TextEditingController();
  List<String> sections = ["Audio", "Video", "Stories"];
  List<String> genres = [
    "Education",
    "Romantic",
    "Science",
    "Horror",
    "Comedy",
    "Drama"
  ];
  List<DropdownMenuItem<String>> _dropDownSectionItems;
  List<DropdownMenuItem<String>> _dropDownGenreItems;

  List<DropdownMenuItem<String>> getDropDownMenuItems(_dropDownMenuItems) {
    List<DropdownMenuItem<String>> items = new List();
    for (String text in _dropDownMenuItems) {
      items.add(new DropdownMenuItem(value: text, child: new Text(text)));
    }
    return items;
  }

  @override
  void initState() {
    // TODO: implement initState
    _dropDownSectionItems = getDropDownMenuItems(sections);
    _dropDownGenreItems = getDropDownMenuItems(genres);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(1.0, 0, 1.0, 0),
        child: ListView(
          children: <Widget>[
            sectionWithFitlerView(),
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

  Widget sectionWithFitlerView() {
    return new Container(
        child: new Row(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(12.0),
              child: DropdownButtonHideUnderline(
                child: new DropdownButton(
                  value: "Video",
                  items: _dropDownSectionItems,
                  onChanged: (String value) {
                    Fluttertoast.showToast(
                        msg: "$value",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                ),
              )),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: DropdownButtonHideUnderline(
              child: new DropdownButton(
                value: "Romantic",
                items: _dropDownGenreItems,
                onChanged: (String value) {
                  Fluttertoast.showToast(
                      msg: "$value",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) =>
                          AllGenresWidget()));
                },
                child: Text(
                  "Test",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
              )),
          Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          )
        ]));
  }

}
