import 'package:flutter/material.dart';
import 'package:salv/UI/pages/beranda_page.dart';
import 'package:salv/UI/pages/detail_edukasi_page.dart';
import 'package:salv/UI/pages/detail_iklan_page.dart';
import 'package:salv/UI/pages/detail_penawaran_page.dart';
import 'package:salv/UI/pages/edukasi_page.dart';
import 'package:salv/UI/pages/form_jual_limbah_page.dart';
import 'package:salv/UI/pages/holder_page.dart';
import 'package:salv/UI/pages/home_page.dart';
import 'package:salv/UI/pages/iklan_page.dart';
import 'package:salv/UI/pages/jual_limbah_success_page.dart';
import 'package:salv/UI/pages/penawaran_page.dart';
import 'package:salv/UI/pages/pencairan_poin_page.dart';
import 'package:salv/UI/pages/profil_page.dart';

import 'package:salv/UI/pages/sign_up_page.dart';
import 'package:salv/UI/pages/sign_up_set_profil.dart';
import 'package:salv/UI/pages/sign_up_success_page.dart';
import 'package:salv/UI/pages/sign_up_wilayah_page.dart';
import 'package:salv/UI/pages/splash_page.dart';
import 'package:salv/UI/pages/ubah_data_alamat_page.dart';
import 'package:salv/UI/pages/ubah_data_profil_page.dart';
import 'package:salv/common/common.dart';

import 'UI/pages/sign_in_page.dart';
import 'UI/pages/sign_up_wilayah_2_page.dart';

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
                  color: blackColor, fontSize: 20, fontWeight: FontWeight.w700),
              iconTheme: IconThemeData(color: blackColor))),
      routes: {
        SplashPage.routeName: (context) => SplashPage(),
        HolderPage.routeName: (context) => HolderPage(),
        BerandaPage.routeName: (context) => BerandaPage(),
        EdukasiPage.routeName: (context) => EdukasiPage(),
        IklanPage.routeName: (context) => IklanPage(),
        PenawaranPage.routeName: (context) => PenawaranPage(),
        ProfilPage.routeName: (context) => ProfilPage(),
        SigninPage.routeName: (context) => SigninPage(),
        SignupPage.routeName: (context) => SignupPage(),
        SignupWilayahPage.routeName: (context) => SignupWilayahPage(),
        SignupWilayah2Page.routeName: (context) => SignupWilayah2Page(),
        SignupSetProfilPage.routeName: (context) => SignupSetProfilPage(),
        SignupSuccessPage.routeName: (context) => SignupSuccessPage(),
        DetailIklanPage.routeName: (context) => DetailIklanPage(),
        FormJualLimbahPage.routeName: (context) => FormJualLimbahPage(),
        JualLimbahSuccessPage.routeName: (context) => JualLimbahSuccessPage(),
        DetailPenawaranPage.routeName: (context) => DetailPenawaranPage(),
        DetailEdukasiPage.routeName: (context) => DetailEdukasiPage(),
        PencairanPoinPage.routeName: (context) => PencairanPoinPage(),
        UbahDataProfilPage.routeName: (context) => UbahDataProfilPage(),
        UbahDataAlamatPage.routeName: (context) => UbahDataAlamatPage()
      },
    );
  }
}
