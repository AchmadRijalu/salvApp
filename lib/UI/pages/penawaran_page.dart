import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/detail_iklan_page.dart';
import 'package:salv/UI/pages/detail_penawaran_page.dart';
import 'package:salv/UI/widgets/list_penawaran_widget.dart';
import 'package:salv/common/common.dart';

class PenawaranPage extends StatelessWidget {
  static const routeName = '/penawaran';
  const PenawaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(
              height: 40,
            ),
            Row(children: [Image.asset('assets/image/logo-png.png')]),
            const SizedBox(
              height: 14,
            ),
            Expanded(
                child: Container(
              child: SingleChildScrollView(
                  child: Column(children: [
                Row(
                  children: [
                    Text(
                      "Riwayat Penawaran",
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Text(
                      "Yuk lihat penawaran Anda! Tolak Terima \nlebih gampang daripada ditolak melulu",
                      style: greyTextStyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ListPenawaran(
                      gambar: "assets/image/image_profilepng.png",
                      namaLimbah: "Butuh Wortel Busuk",
                      beratLimbah: 50,
                      statusPenawaran: "Sedang Berlangsung",
                      tanggal: "14/04/23",
                      username: 'Mimi Jinhiro',
                      onTap: () {
                        Navigator.pushNamed(
                            context, DetailPenawaranPage.routeName);
                      },
                    ),
                  ],
                )
              ])),
            ))
          ]),
        ),
      ),
    );
  }
}
