import 'dart:async';

import 'package:flutter/material.dart';

import 'package:salv/UI/pages/holder_page.dart';

import 'package:salv/common/common.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        (() => Navigator.pushNamedAndRemoveUntil(
            context, HolderPage.routeName, (route) => false)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Center(
        child: Container(
          width: 182,
          height: 82,
          decoration: BoxDecoration(
              color: greenColor,
              image: DecorationImage(
                  image: AssetImage('assets/image/logowhite-png.png'))),
        ),
      ),
    );
  }
}
