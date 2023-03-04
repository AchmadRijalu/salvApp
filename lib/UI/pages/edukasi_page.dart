import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/detail_edukasi_page.dart';
import 'package:salv/UI/widgets/list_edukasi_widget.dart';

import '../../common/common.dart';

class EdukasiPage extends StatelessWidget {
  static const routeName = '/edukasi';
  const EdukasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(
              height: 44,
            ),
            Row(children: [Image.asset('assets/image/logo-png.png')]),
            const SizedBox(
              height: 14,
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
                          "Mengapa Limbah Makanan \nPenting?",
                          style: blackTextStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 46,
                    ),
                    ListEdukasi(
                      onTap: () {
                        Navigator.pushNamed(
                            context, DetailEdukasiPage.routeName);
                      },
                      gambarLimbah: "assets/image/image_profilepng.png",
                      namaTutorial:
                          "Cara membuat kompos dari sampah rumah tangga tanpa bau",
                      durasiVideo: 15,
                      tipeLimbah: "Buah-buahan",
                    ),
                    ListEdukasi(
                      gambarLimbah: "assets/image/image_sampah.png",
                      namaTutorial:
                          "Cara membuat kompos dari sampah rumah tangga tanpa bau",
                      durasiVideo: 15,
                      tipeLimbah: "Buah-buahan",
                    )
                  ],
                ),
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
