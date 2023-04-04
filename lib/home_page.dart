import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:uts_tpm/bangun_datar_page.dart';
import 'package:uts_tpm/kalender_page.dart';
import 'package:uts_tpm/login_page.dart';
import 'package:uts_tpm/profile_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Pilih Menu",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.amber[100],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const <Widget>[
                          Icon(
                            Icons.account_circle_rounded,
                            size: 60,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Profile',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => ProfilePage());
                    Navigator.push(context, route);
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.amber[100],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const <Widget>[
                          Icon(
                            Icons.calculate_rounded,
                            size: 60,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Bangun Datar',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => BangunDatarPage());
                    Navigator.push(context, route);
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.amber[100],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const <Widget>[
                          Icon(
                            Icons.today_outlined,
                            size: 60,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Kalender',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => KalenderPage());
                    Navigator.push(context, route);
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.amber[100],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const <Widget>[
                          Icon(
                            Icons.logout_rounded,
                            size: 60,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Logout',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => LoginPage());
                    Navigator.push(context, route);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
