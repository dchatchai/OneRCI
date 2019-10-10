import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onerci/screens/home.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
// Exclipit

// Method
  Widget signOutButton() {
    return IconButton(
      tooltip: 'Sign Out and Back Home',
      icon: Icon(Icons.exit_to_app),
      onPressed: () {processSignOut();},
    );
  }

  Future<void> processSignOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response){});
    MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Home());
    Navigator.of(context).pushAndRemoveUntil(materialPageRoute,(Route<dynamic> route) => false );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
        actions: <Widget>[signOutButton()],
      ),
      body: Text('body'),
    );
  }
}
