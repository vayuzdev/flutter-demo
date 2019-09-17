import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/ui/signup/signup_lang.dart';

class GenresListing extends StatelessWidget {
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: new Text("Select Genres"),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                child: searchHeader(),
              ),


              Expanded(

                  child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 5),
                children: List.generate(10, (index) {
                  return Card(
                      elevation: 8.0,
                      child: Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: new Text("Genre"),
                        ),
                        Expanded(child: SizedBox()),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: false,
                              onChanged: (bool value) {},
                            ),
                          ],
                        ),
                      ])); //robohash.org api provide you different images for any number you are giving
                }),
              ))
            ],
          )),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ButtonTheme(
                child: new SizedBox(
                    width: double.infinity,
                    child: OutlineButton(
                        borderSide: BorderSide(color: Colors.blue),
                        onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupLanguage()),
                    );
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )))),
          )
        ]));
  }
}
