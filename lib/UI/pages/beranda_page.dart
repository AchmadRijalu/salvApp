import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/widgets/list_limbah_widget.dart';
import 'package:salv/common/common.dart';

class BerandaPage extends StatelessWidget {
  static const routeName = '/beranda';
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37),
      child: Container(
        child: Column(children: [
          const SizedBox(
            height: 44,
          ),
          Row(children: [Image.asset('assets/image/logo-png.png')]),
          const SizedBox(
            height: 17,
          ),
          Expanded(
              child: Container(
                  child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      LimbahBerandaPage(),
                      LimbahBerandaPage(),
                      LimbahBerandaPage(),
                      LimbahBerandaPage()
                    ],
                  )
                ]),
          )))
        ]),
      ),
    ));
  }
}
