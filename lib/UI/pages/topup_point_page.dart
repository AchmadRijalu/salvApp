import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/common/common.dart';

class TopupPointPage extends StatelessWidget {
  static const routeName = '/topup';
  const TopupPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kembali")),
      backgroundColor: lightBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(
              "assets/image/image_ovo.png",
              width: 100,
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Text(
            "Silahkan melakukan top up OVO \nSesuai nominal yang Anda inginkan",
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "ke nomor berikut :",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          Text(
            "081234510912",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "mohon cantumkan username anda sebagai \nketerangan tambahan pada \nsaat transaksi",
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight:light),
            textAlign: TextAlign.center,
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
        ],
      )),
    );
  }
}
