import 'package:flutter/material.dart';
import 'package:salv/UI/pages/beranda_page.dart';
import 'package:salv/UI/pages/edukasi_page.dart';
import 'package:salv/UI/pages/holder_page.dart';
import 'package:salv/UI/pages/home_page.dart';
import 'package:salv/UI/pages/iklan_page.dart';
import 'package:salv/UI/pages/penawaran_page.dart';
import 'package:salv/UI/pages/profil_page.dart';
import 'package:salv/UI/pages/splash_page.dart';
import 'package:salv/common/common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salv',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
              elevation: 0,
              backgroundColor: lightBackgroundColor,
              centerTitle: true,
              titleTextStyle: blackTextStyle.copyWith(
                  color: blackColor, fontSize: 20, fontWeight: FontWeight.w600),
              iconTheme: IconThemeData(color: blackColor))),
      routes: {
        SplashPage.routeName: (context) => SplashPage(),
        HolderPage.routeName: (context) => HolderPage(),
        BerandaPage.routeName: (context) => BerandaPage(),
        EdukasiPage.routeName: (context) => EdukasiPage(),
        IklanPage.routeName: (context) => IklanPage(),
        PenawaranPage.routeName: (context) => PenawaranPage(),
        ProfilPage.routeName: (context) => ProfilPage()
      },
    );
  }
}
