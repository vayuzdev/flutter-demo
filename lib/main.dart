import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/ui/NetworkCallSample.dart';
import 'package:social/ui/home_page.dart';
import 'package:social/ui/signup/signup_email.dart';
import 'package:social/ui/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new MainBody(),
    );
  }
}

class MainBody extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

    final passwordField = new TextFormField(
      decoration: new InputDecoration(
        labelText: "Password",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(4.0),
          borderSide: new BorderSide(),
        ),
        //fillColor: Colors.green
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Password cannot be empty";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.text,
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
    );

    final loginButon = ButtonTheme(
        child: new SizedBox(
            width: double.infinity,
            child: OutlineButton(
                borderSide: BorderSide(color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TabBarDemo()),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ))));
 final networkDemo= ButtonTheme(
        child: new SizedBox(
            width: double.infinity,
            child: OutlineButton(
                borderSide: BorderSide(color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NetworkCallSample()),
                  );
                },
                child: Text(
                  "Netwrok Demo",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ))));

    final dontHaveAnAccount = new Padding(
        padding: EdgeInsets.all(8.0),
        child: new GestureDetector(
          child: new Text("Don't have an account?"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupEmail()),
            );
          },
        ));

    return Scaffold(
        body: SingleChildScrollView(
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
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 15.0,
                ),
                new Row(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: new Text("Forgot Password?"))
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                loginButon,
                networkDemo,
                SizedBox(
                  height: 15.0,
                ),
                dontHaveAnAccount
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
