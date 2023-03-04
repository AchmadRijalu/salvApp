import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../common/common.dart';

class DetailIklanPabrikPage extends StatelessWidget {
  static const routeName = '/detailiklanpabrik';
  const DetailIklanPabrikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Iklan")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          color: Colors.amber,
          child: ListView(children: [
            const SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
              decoration: BoxDecoration(
                  color: greenColor, borderRadius: BorderRadius.circular(8)),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nama Iklan",
                      style: whiteTextStyle,
                    ),
                    Text(
                      "Butuh Wortel Busuk",
                      style:
                          whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  color: whiteColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kategori",
                      style: whiteTextStyle,
                    ),
                    Text(
                      "Sayur-Sayuran",
                      style:
                          whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  color: whiteColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sistem",
                      style: whiteTextStyle,
                    ),
                    Text(
                      "Sayur-Sayuran",
                      style:
                          whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  color: whiteColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lokasi Penerimaan",
                      style: whiteTextStyle,
                    ),
                    Text(
                      "Universitas Ciputra",
                      style:
                          whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  color: whiteColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spesifikasi",
                      style: whiteTextStyle,
                    ),
                    Text(
                      "Hanya Wortel Biasa",
                      style:
                          whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ]),
            ),
            const SizedBox(
              height: 14,
            ),
          ]),
        ),
      ),
    );
  }
}
