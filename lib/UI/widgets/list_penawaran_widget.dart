import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/common/common.dart';

class ListPenawaran extends StatelessWidget {
  final String? namaLimbah;
  final String? username;
  final String? tanggal;
  final String? beratLimbah;
  final String? gambar;
  final VoidCallback? onTap;
  final String? statusPenawaran;
  const ListPenawaran(
      {super.key,
      required this.namaLimbah,
      this.onTap,
      required this.beratLimbah,
      this.gambar,
      required this.statusPenawaran,
      required this.tanggal,
      required this.username});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 82,
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
            color: statusPenawaran == 'Respon' ||
                    statusPenawaran == "Sedang Berlangsung" ||
                    statusPenawaran == "Menunggu Konfirmasi"
                ? greenColor
                : whiteColor,
            borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                gambar!,
                fit: BoxFit.fill,
              ),
            ),
          )),
          Expanded(
              flex: 3,
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.all(6),
                child: Row(children: [
                  Expanded(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(namaLimbah!,
                                overflow: TextOverflow.clip,
                                style: statusPenawaran == 'Respon' ||
                                        statusPenawaran ==
                                            "Sedang Berlangsung" ||
                                        statusPenawaran == "Menunggu Konfirmasi"
                                    ? whiteTextStyle.copyWith(
                                        fontWeight: FontWeight.w700)
                                    : greenTextStyle.copyWith(
                                        fontWeight: FontWeight.w700))),
                        Flexible(
                            child: Container(
                          width: double.infinity,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  username!,
                                  style: statusPenawaran == 'Respon' ||
                                          statusPenawaran ==
                                              "Sedang Berlangsung" ||
                                          statusPenawaran ==
                                              "Menunggu Konfirmasi"
                                      ? whiteTextStyle.copyWith(fontSize: 10)
                                      : greenTextStyle.copyWith(fontSize: 10),
                                )
                              ]),
                        ))
                      ],
                    ),
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        tanggal!,
                                        style: statusPenawaran == 'Respon' ||
                                                statusPenawaran ==
                                                    "Sedang Berlangsung" ||
                                                statusPenawaran ==
                                                    "Menunggu Konfirmasi"
                                            ? whiteTextStyle.copyWith(
                                                fontSize: 7)
                                            : greenTextStyle.copyWith(
                                                fontSize: 7),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    beratLimbah!.toString(),
                                    style: statusPenawaran == 'Respon' ||
                                            statusPenawaran ==
                                                "Sedang Berlangsung" ||
                                            statusPenawaran ==
                                                "Menunggu Konfirmasi"
                                        ? whiteTextStyle.copyWith(fontSize: 10)
                                        : greenTextStyle.copyWith(fontSize: 10),
                                  )
                                ],
                              ))
                            ]),
                      )),
                      Expanded(
                          child: Container(
                              width: double.infinity,
                              height: 23,
                              decoration: BoxDecoration(
                                  color: statusPenawaran == "Konfirmasi"? greenColor: whiteColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(statusPenawaran!,
                                      textAlign: TextAlign.center,
                                      style: statusPenawaran == 'Respon' ||
                                              statusPenawaran ==
                                                  "Menunggu Konfirmasi"
                                          ? greenTextStyle.copyWith(
                                              fontSize: 12)
                                          : statusPenawaran == "Diterima"
                                              ? greenTextStyle.copyWith(
                                                  fontSize: 12)
                                              : statusPenawaran ==
                                                          "Dibatalkan" ||
                                                      statusPenawaran ==
                                                          "Ditolak"
                                                  ? redTextStyle.copyWith(
                                                      fontSize: 12)
                                                  : statusPenawaran ==
                                                          "Sedang Berlangsung"
                                                      ? greenTextStyle.copyWith(
                                                          fontSize: 12)
                                                      : whiteTextStyle.copyWith(
                                                          fontSize: 12))
                                ],
                              )))
                    ],
                  ))
                ]),
              ))
        ]),
      ),
    );
  }
}
