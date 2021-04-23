import 'package:flutter/material.dart';
import 'package:prak10minggu11/UI/login_page.dart';


class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(),
            Hero(
              tag: 'logoAnimation',
              child: Image.asset(
                'assets/images/ss.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
               // ignore: deprecated_member_use
               child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    color: Colors.white,
                    onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                    child:Text('Get Sarted', style: TextStyle(fontSize: 20, color: Colors.black),) ,),
              )
            
          ],
        ),
      ),
    );
  }
}