import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/holder_page.dart';
import 'package:salv/UI/pages/home_page.dart';

import '../../common/common.dart';
import '../widgets/buttons.dart';

class SignupSuccessPage extends StatelessWidget {
  static const routeName = '/signupsuccess';
  const SignupSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Akun Berhasil\nTerdaftar",
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          SizedBox(
            height: 26,
          ),
          Text(
            "Lindungi Lingkungan \ndengan bergabung bersama Kami",
            style: greyTextStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: "Mulai",
            width: 183,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HolderPage.routeName, (route) => false);
            },
          )
        ],
      )),
    );
  }
}
