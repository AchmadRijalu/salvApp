import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:salv/UI/pages/form_jual_limbah_page.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/common/common.dart';

import '../../models/user_model.dart';

class DetailIklanPage extends StatefulWidget {
  const DetailIklanPage({super.key});
  static const routeName = '/detailiklan';

  @override
  State<DetailIklanPage> createState() => _DetailIklanPageState();
}

class _DetailIklanPageState extends State<DetailIklanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Iklan")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(children: [
                  //Only for Mahasiswa
                  if (userList.last.type == "seller") ...[
                    Flexible(
                        child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "242 / 450",
                                style: blueTextStyle.copyWith(
                                    fontSize: 48, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Kg",
                                style: blueTextStyle.copyWith(fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Iklan dibuat pada 14/04/23",
                                style: blueTextStyle.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 29,
                          ),
                          Flexible(
                              child: Container(
                            margin: const EdgeInsets.only(left: 9),
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
                        ],
                      ),
                    )),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                  // if pabrik
                  Expanded(
                      flex: userList.last.type == "buyer" ? 3 : 4,
                      child: Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                        "Ketersediaan Sistem",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "Diantar,diambil",
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
                                        "Lokasi Tujuan",
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
                                        "Spesifikasi",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "Hanya Wortel Biasa",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                height: 14,
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
                                        "Lokasi Tujuan",
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
                                        "Spesifikasi",
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "Hanya Wortel Biasa",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                              if (userList.last.type == "seller") ...[
                                const SizedBox(
                                  height: 48,
                                ),
                                CustomFilledButton(
                                  title: "Buat Penawaran",
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, FormJualLimbahPage.routeName);
                                  },
                                )
                              ]
                            ]),
                      )),

                  const SizedBox(
                    height: 23,
                  ),

                  if (userList.last.type == "buyer") ...[
                    Expanded(
                        child: Container(
                      child: Column(children: [
                        Flexible(
                            child: Container(
                                child: Column(
                          children: [
                            SvgPicture.asset(
                                "assets/image/image_details_iklan_pabrik.svg"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Berlangsung"),
                                Text("Selesai"),
                                Text("Dibatalkan")
                              ],
                            )
                          ],
                        ))),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Expanded(
                                    child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                      color: greenColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Tidak ada Batas Kadaluarsa",
                                          style: whiteTextStyle.copyWith(
                                              fontWeight: semiBold,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Flexible(
                                        child: Container(
                                      margin: const EdgeInsets.only(left: 9),
                                      child: LinearPercentIndicator(
                                        trailing: Text(
                                          "350kG",
                                          style: whiteTextStyle.copyWith(
                                              fontWeight: semiBold,
                                              fontSize: 15),
                                        ),
                                        lineHeight: 11,
                                        percent: 0.5,
                                        animation: true,
                                        progressColor: blueColor,
                                        backgroundColor: greyColor,
                                        barRadius: Radius.circular(8),
                                      ),
                                    )),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.red.shade900),
                                        onPressed: () {},
                                        child: Text(
                                          "Batalkan Iklan",
                                        )),
                                    Expanded(
                                        child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Dibuat: 11 Februari 2021",
                                              style: whiteTextStyle.copyWith(
                                                  fontWeight: medium,
                                                  fontSize: 9),
                                            )
                                          ]),
                                    ))
                                  ]),
                                ))
                              ],
                            )),
                      ]),
                    )),
                  ]
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
