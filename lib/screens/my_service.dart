import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onerci/screens/home.dart';
import 'package:onerci/screens/my_style.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
// Exclipit

// Method

  Widget myDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myHeadDrawer(),
          menuShowListProduct(),
          Divider(),
          menuShowAddProduct(),
          Divider(),
        ],
      ),
    );
  }

  Widget menuShowListProduct() {
    return ListTile(
      leading: Icon(
        Icons.filter_1,
        size: 36.0,
        color: Colors.purple,
      ),
      title: Text('List All Products'),
      subtitle: Text('Show All Products in my Factory'),
    );
  }

  Widget menuShowAddProduct() {
    return ListTile(
      leading: Icon(
        Icons.filter_2,
        size: 36.0,
        color: Colors.blue,
      ),
      title: Text('Add Product'),
      subtitle: Text('Show Add Product page'),
    );
  }

  Widget myHeadDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/wallpaper.jpg'), fit: BoxFit.cover),
      ),
      child: Column(
        children: <Widget>[
          showLogo(),
          showAppName(),
          showLogin(),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 70,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'One RCI',
      style: TextStyle(
          fontSize: MyStyle().h2,
          color: MyStyle().textColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontFamily: 'BalooBhai'),
    );
  }

  Widget showLogin() {
    return Text('Login by ');
  }

  Widget signOutButton() {
    return IconButton(
      tooltip: 'Sign Out and Back Home',
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        processSignOut();
      },
    );
  }

  Future<void> processSignOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {});
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => Home());
    Navigator.of(context)
        .pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
        actions: <Widget>[signOutButton()],
      ),
      body: Text('body'),
      drawer: myDrawer(),
    );
  }
}
