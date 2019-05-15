import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
      },
      decoration: InputDecoration(
          labelText: 'Email Address', hintText: 'example@mail.com'),
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      obscureText: true,
      validator: (String value) {
        if (value.length < 4) {
          return 'Pasword must be at least 4 characters';
        }
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Log In'),
      color: Colors.blue,
      onPressed: () {
        formKey.currentState.validate();
      },
      textColor: Colors.white,
    );
  }
}
