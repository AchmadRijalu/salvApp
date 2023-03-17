import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../widgets/buttons.dart';
import 'holder_page.dart';

class TerimaPenawaranLimbahSuccessPage extends StatelessWidget {
  static const routeName = '/TolakPenawaranLimbahSuccess';
  const TerimaPenawaranLimbahSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Penerimaan Penawaran Limbah \nBerhasil",
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
            title: "Kembali",
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
