import 'package:flutter/material.dart';
import 'package:uts_tpm/bangun_datar_page.dart';
import 'package:uts_tpm/home_page.dart';
import 'package:uts_tpm/kalender_page.dart';
import 'package:uts_tpm/login_page.dart';
import 'package:uts_tpm/profile_page.dart';
import 'package:uts_tpm/tabung_page.dart';
import 'package:uts_tpm/trapesium_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/bangun-datar': (context) => BangunDatarPage(),
        '/trapesium': (context) => TrapesiumPage(),
        '/tabung': (context) => TabungPage(),
        '/kalender': (context) => KalenderPage(),
        '/profile': (context) => ProfilePage(),
        '/detail': (context) => DetailProfilePage(),
      },
    );
  }
}
