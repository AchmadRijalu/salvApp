import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:salv/common/common.dart';

class DetailPenawaranPage extends StatelessWidget {
  static const routeName = '/detailpenawaran';
  const DetailPenawaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Penawaran")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 17),
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(children: [
                  Flexible(
                      child: Container(
                    child: Column(children: [
                      Flexible(
                          child: Container(
                        child: Row(children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: Column(children: [
                                  Flexible(
                                      child: Container(
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Sisa Limbah yang Dibutuhkan")
                                        ]),
                                  )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: Row(children: [
                                          Flexible(
                                            child: Text(
                                              "287",
                                              style: blueTextStyle.copyWith(
                                                  fontSize: 48,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Expanded(
                                              child: Container(
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 12),
                                                    child: Row(
                                                      children: [
                                                        Text("dari"),
                                                        const SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          "350 Kg",
                                                          style: blueTextStyle
                                                              .copyWith(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ]),
                                          ))
                                        ]),
                                      ))
                                ]),
                              )),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/image/image_detail_penawaranpng.png"),
                                    fit: BoxFit.fitWidth)),
                          )),
                        ]),
                      )),
                      Flexible(
                          child: Container(
                        child: Column(children: [
                          Flexible(
                              child: Container(
                            child: LinearPercentIndicator(
                              lineHeight: 27,
                              percent: 0.5,
                              animation: true,
                              progressColor: blueColor,
                              backgroundColor: greyColor,
                              barRadius: Radius.circular(8),
                            ),
                          )),
                          const SizedBox(
                            height: 6,
                          ),
                          Flexible(
                              child: Container(
                            padding: const EdgeInsets.only(right: 20, left: 21),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "0 Kg",
                                  style: blueTextStyle.copyWith(fontSize: 16),
                                ),
                                Text(
                                  "450Kg",
                                  style: blueTextStyle.copyWith(fontSize: 16),
                                )
                              ],
                            ),
                          ))
                        ]),
                      ))
                    ]),
                  )),
                  Flexible(
                      flex: 4,
                      child: Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17, vertical: 16),
                                decoration: BoxDecoration(
                                    color: greenColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Nama Iklan",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "Butuh Wortel Busuk",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Kategori",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "Sayur-Sayuran",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Spesifikasi",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "Hanya Wortel Busuk",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Ketentuan",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17, vertical: 16),
                                decoration: BoxDecoration(
                                    color: greenColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Tanggal Kadaluarsa",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "-",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Berat Minimum",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "1 Gram",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Berat Maksimum",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "35 Kg",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Pendapatan",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "+Rp.20.000/gram",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Data Pengiriman",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17, vertical: 16),
                                decoration: BoxDecoration(
                                    color: greenColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Berat yang Diberikan",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "50 kg",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Lokasi",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "Universitas Ciputra",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sistem",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "Diantar",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Pendapatan",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "+Rp. 1.000.000.000",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                            ]),
                      ))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
