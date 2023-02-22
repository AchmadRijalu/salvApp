import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/widgets/limbah_beranda_widget.dart';
import 'package:salv/common/common.dart';

class BerandaPage extends StatelessWidget {
  static const routeName = '/beranda';
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 44),
      child: Container(
        child: Column(children: [
          Row(children: [Image.asset('assets/image/logo-png.png')]),
          const SizedBox(
            height: 17,
          ),
          Row(
            children: [
              Text(
                "Wah, limbah makanan \nmana yang ingin Anda cari \ntahu, yuk lihat-lihat!",
                style: blackTextStyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w700),
              )
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Row(
            children: [
              Text(
                "Coba ketuk salah satu kategori limbah \nmakanannya.",
                style: greyTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Expanded(
              child: ListView(
            shrinkWrap: true,
            children: [
              LimbahBerandaPage(),
              LimbahBerandaPage(),
              LimbahBerandaPage(),
              LimbahBerandaPage()
            ],
          ))
        ]),
      ),
    ));
  }
}
