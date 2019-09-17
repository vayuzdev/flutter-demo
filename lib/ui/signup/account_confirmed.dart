import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'basic_user_info.dart';

class AccountConfirmed extends StatelessWidget {
  final emailField = new TextFormField(
    decoration: new InputDecoration(
      labelText: "OTP",
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


  Widget alreadyAMemberWidget = Row(
    children: <Widget>[
      Expanded(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: new Text("Already a Member ?"),
          ),
        ),
      )
    ],
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
                                      "assets/check.gif",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 45.0),


                                ]))))),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
            child: ButtonTheme(
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
                                    SignupUserBasicInfo()),
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
