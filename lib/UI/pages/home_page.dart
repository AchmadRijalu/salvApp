import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/beranda_page.dart';
import 'package:salv/UI/pages/edukasi_page.dart';
import 'package:salv/UI/pages/iklan_page.dart';
import 'package:salv/UI/pages/penawaran_page.dart';
import 'package:salv/UI/pages/profil_page.dart';
import 'package:salv/common/common.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homePabrik';

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavbarItems = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset("assets/image/icon_beranda.svg"),
        activeIcon: SvgPicture.asset(
          "assets/image/icon_beranda.svg",
          color: greenColor,
        ),
        label: "Beranda"),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/image/icon_iklan.svg",
        ),
        activeIcon: SvgPicture.asset(
          "assets/image/icon_iklan.svg",
          color: greenColor,
        ),
        label: "Iklan"),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/image/icon_penawaran.svg",
        ),
        activeIcon: SvgPicture.asset(
          "assets/image/icon_penawaran.svg",
          color: greenColor,
        ),
        label: "Penawaran"),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/image/icon_edukasi.svg",
        ),
        activeIcon: SvgPicture.asset(
          "assets/image/icon_edukasi.svg",
          color: greenColor,
        ),
        label: "Edukasi"),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/image/icon_profil.svg",
        ),
        activeIcon: SvgPicture.asset(
          "assets/image/icon_profil.svg",
          color: greenColor,
        ),
        label: "Profil")
  ];

  List<Widget> listWidget = [
    BerandaPage(),
    IklanPage(),
    PenawaranPage(),
    EdukasiPage(),
    ProfilPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: greenColor,
        unselectedItemColor: greyColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomNavbarItems,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            greenTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
        unselectedLabelStyle:
            greenTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
        onTap: (selected) {
          setState(() {
            currentIndex = selected;
          });
        },
      ),
    );
  }
}
