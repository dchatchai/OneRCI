import 'package:flutter/material.dart';
import 'package:onerci/screens/my_style.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Explicit
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

// Method
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.face,
            size: 36.0,
            color: Colors.purple,
          ),
          labelText: 'Display Name :',
          helperText: 'Type Your Name',
          hintText: 'English Only'),
      onSaved: (value) {
        nameString = value.trim();
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            size: 36.0,
            color: Colors.blueAccent,
          ),
          labelText: 'Email :',
          helperText: 'Type Your Email',
          hintText: 'you@email.com'),
      onSaved: (value) {
        emailString = value.trim();
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: Colors.green,
          ),
          labelText: 'Password :',
          helperText: 'Type Your Password',
          hintText: 'More 6 Charactors'),
      onSaved: (value) {
        passwordString = value.trim();
      },
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('You Click Upload');
        formKey.currentState.save();
        print(
            'name = $nameString, email = $emailString, password = $passwordString');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().textColor,
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(50.0),
          children: <Widget>[
            nameText(),
            emailText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
