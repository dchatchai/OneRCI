import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onerci/screens/my_service.dart';
import 'package:onerci/screens/my_style.dart';
import 'package:onerci/screens/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// Explicit ประกาศตัวแปร
  final formKey = GlobalKey<FormState>();
  String emailString, passwordString;

// Method

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  Widget signInButton() {
    return RaisedButton(
      color: MyStyle().textColor,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        formKey.currentState.save();
        print('email = $emailString, password = $passwordString');
        checkAuthen();
      },
    );
  }

  Future<void> checkAuthen() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  Widget showTitle(String title) {
    return ListTile(
      leading: Icon(
        Icons.add_alert,
        size: 48.0,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontSize: MyStyle().h2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: showTitle(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget signUpButton() {
    return OutlineButton(
      child: Text('Sign UP'),
      onPressed: () {
        print('You Click Sign Up');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget showButton() {
    return Row(
      children: <Widget>[
        signInButton(),
        SizedBox(
          width: 4.0,
        ),
        signUpButton(),
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }

  Widget passwordText() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: MyStyle().textColor,
          ),
          labelText: 'Password :',
          labelStyle: TextStyle(color: MyStyle().textColor),
        ),
        onSaved: (value) {
          passwordString = value.trim();
        },
      ),
      width: 250.0,
    );
  }

  Widget userText() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.account_circle,
            size: 36.0,
            color: MyStyle().textColor,
          ),
          labelText: 'User :',
          labelStyle: TextStyle(color: MyStyle().textColor),
        ),
        onSaved: (value) {
          emailString = value.trim();
        },
      ),
      width: 250.0,
    );
  }

  Widget showLogo() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'One RCI',
      style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Colors.blueAccent[100],
          fontFamily: 'BalooBhai'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, MyStyle().mainColor],
              radius: 1.0,
            ),
          ),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  showLogo(),
                  showAppName(),
                  userText(),
                  passwordText(),
                  SizedBox(
                    height: 8.0,
                  ),
                  showButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
