import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'genre_listing.dart';

class UserLocation extends StatelessWidget {
  final emailField = new TextFormField(
    decoration: new InputDecoration(
      labelText: "Location",
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



  final loginButon = ButtonTheme(
      child: new SizedBox(
          width: double.infinity,
          child: OutlineButton(
              borderSide: BorderSide(color: Colors.blue),
              onPressed: () {},
              child: Text(
                "Next",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ))));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
                child: Center(
                    child: Container(
                        color: Colors.white,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 45.0),
                                  SizedBox(
                                    height: 155.0,
                                    child: Image.asset(
                                      "assets/app_logo.gif",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 45.0),
                                  emailField,
                                  SizedBox(
                                    height: 15.0,
                                  ),

                                  ButtonTheme(
                                      child: new SizedBox(
                                          width: double.infinity,
                                          child: OutlineButton(
                                              borderSide:
                                              BorderSide(color: Colors.blue),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          GenresListing()),
                                                );
                                              },
                                              child: Text(
                                                "Next",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                ),
                                              ))))
                                ]))))),
          ),
        ]));
  }
}
