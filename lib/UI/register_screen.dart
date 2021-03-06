import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:prak10minggu11/UI/auth.dart';
import 'package:prak10minggu11/UI/profile_screen.dart';

import 'package:flutter/cupertino.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var authHandler = new Auth();
  bool _isHidePassword1 = true;


  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword1 = !_isHidePassword1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(
          'Halaman Register',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Center(
          child: ListView(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            // E-mail TextField
                            Container(
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    contentPadding: EdgeInsets.all(15),
                                    icon: Icon(
                                      Icons.account_circle,
                                      color: Colors.blue,
                                    ),
                                    filled: true,
                                    fillColor: Colors.blue,
                                    focusColor: Colors.blue,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: 'E-mail'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter an Email Address';
                                  } else if (!value.contains('@')) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.all(10),
                            ),

                            // Password TextField
                            Container(
                              child: TextFormField(
                                controller: _passController,
                                obscureText: _isHidePassword1,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    contentPadding: EdgeInsets.all(15),
                                    icon: Icon(
                                      Icons.lock,
                                      color: Colors.blue,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        _togglePasswordVisibility();
                                      },
                                      child: Icon(
                                        _isHidePassword1
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: _isHidePassword1
                                            ? Colors.white
                                            : Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.blue,
                                    focusColor: Colors.blue,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: 'Password'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Password';
                                  } else if (value.length < 6) {
                                    return 'Password must be atleast 6 characters!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            
                            Padding(
                              padding: EdgeInsets.only(top: 60),
                            ),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(30),
                              ),
                            
                              onPressed: () {
                                authHandler
                                    .createUserWithEmail(_emailController.text,
                                        _passController.text)
                                    .then((User user) {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new ProfilePage()));
                                }).catchError((e) => print(e));
                              },
                              
                              child: Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
