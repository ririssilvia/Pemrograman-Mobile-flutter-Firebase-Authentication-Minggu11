import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prak10minggu11/UI/Success_Screen.dart';
import 'package:prak10minggu11/UI/auth.dart';
import 'package:prak10minggu11/UI/profile_screen.dart';
import 'package:prak10minggu11/UI/register_screen.dart';
import 'package:prak10minggu11/UI/sign_in.dart';
import 'package:prak10minggu11/UI/first_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  //tambahkan form
  final _formKey = GlobalKey<FormState>();
  var authHandler = new Auth();

  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(
          'Halaman Login',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Center(
          child: ListView(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'assets/images/login.jpg',
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
                                obscureText: _isHidePassword,
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
                                        _isHidePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: _isHidePassword
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
                              padding: EdgeInsets.only(top: 20),
                            ),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(30),
                              ),
                              // onPressed: ()  async  {
                              //     if (_formKey.currentState.validate()){}
                              //  authHandler
                              //       .handleSignInEmail(_emailController.text,
                              //           _passController.text)
                              //       .then((User user) {
                              //     Navigator.push(
                              //         context,
                              //         new MaterialPageRoute(
                              //             builder: (context) =>
                              //                 new ProfilePage()));
                              //   }).catchError((e) => print(e));
                              // },
                                onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                   authHandler
                                    .handleSignInEmail(
                                           _emailController.text,
                                           _passController.text)
                                      .then((User user)  {
                                    if ( user != null) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return SuccessScreen();
                                          },
                                        ),
                                      );
                                    }
                                  });
                                }
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  "OR",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(29),
                                // ignore: deprecated_member_use
                                child: OutlineButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 40),
                                  color: Colors.black,
                                  onPressed: () {
                                    signInWithGoogle().then((result) {
                                      if (result != null) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return FirstScreen();
                                            },
                                          ),
                                        );
                                      }
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  highlightElevation: 5,
                                  borderSide: BorderSide(color: Colors.grey),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                          'assets/images/google_logo.png',
                                          height: 25.0),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Sign in with Google',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "Don’t have account ?",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterPage()));
                                      },
                                      child: Text(
                                        "Register here",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                )),
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