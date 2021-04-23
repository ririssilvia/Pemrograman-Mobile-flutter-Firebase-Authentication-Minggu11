import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prak10minggu11/UI/auth.dart';
import 'package:prak10minggu11/UI/login_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var authHandler = new Auth();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 80, 20, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Congratulations",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      fontSize: 48),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                    thickness: 3,
                  ),
                ),
                SizedBox(height: 60),
              ],
            ),
            Text(
              "Register",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 3,
                  fontSize: 36),
            ),
            Container(
              child: Image.asset(
                'assets/images/uu.png',
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 20),
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Icon(Icons.account_circle,
            //           size: 100, color: Colors.white),
            //       radius: 200,
            //       backgroundColor: Colors.transparent,
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Email',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                auth.currentUser.email,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),

            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                // ignore: deprecated_member_use
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: Colors.white,
                  onPressed: () async {
                    await authHandler.signOut();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new LoginPage()));
                  },
                  child: Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(50),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: Text(
                'Log In',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
