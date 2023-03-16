import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:salv/UI/pages/holder_page.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/blocs/auth/auth_bloc.dart';
import 'package:salv/blocs/transaksi/transaksi_bloc.dart';
import 'package:salv/common/common.dart';
import 'package:salv/models/aksi_transaksi_seller_model.dart';
import 'package:salv/models/user_model.dart';

class DetailPenawaranPage extends StatefulWidget {
  final String? transactionId;
  static const routeName = '/detailpenawaran';
  const DetailPenawaranPage({super.key, this.transactionId});

  @override
  State<DetailPenawaranPage> createState() => _DetailPenawaranPageState();
}

class _DetailPenawaranPageState extends State<DetailPenawaranPage> {
  int status = 0;
  dynamic userId;
  dynamic userType;
  @override
  void initState() {
    super.initState();

    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      userType = authState.user!.type;
      userId = authState.user!.id;
    }
  }

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
                                  if (userType == "buyer") ...[
                                    BlocProvider(
                                      create: (context) => TransaksiBloc()
                                        ..add(TransaksiGetDetailBuyer(
                                            widget.transactionId)),
                                      child: BlocBuilder<TransaksiBloc,
                                          TransaksiState>(
                                        builder: (context, state) {
                                          if (state is DetailTransaksiLoading) {
                                            return Container(
                                                margin: const EdgeInsets.only(
                                                    top: 40),
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: greenColor),
                                                ));
                                          }
                                          if (state
                                              is DetailTransaksiBuyerGetSuccess) {
                                            var detailTransaksi = state
                                                .detailTransaksiBuyer!.data;
                                            return Expanded(
                                                flex: 2,
                                                child: Container(
                                                  child: Row(children: [
                                                    Flexible(
                                                      child: Text(
                                                        detailTransaksi.weight
                                                            .toString(),
                                                        style: blueTextStyle
                                                            .copyWith(
                                                                fontSize: 48,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          12),
                                                              child: Row(
                                                                children: [
                                                                  Text("dari"),
                                                                  const SizedBox(
                                                                    width: 2,
                                                                  ),
                                                                  Text(
                                                                    detailTransaksi
                                                                        .maximumWeight
                                                                        .toString(),
                                                                    style: blueTextStyle.copyWith(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ]),
                                                    ))
                                                  ]),
                                                ));
                                          }
                                          if (state
                                              is DetailTransaksiBuyerFailed) {
                                            return Center(
                                              child: Text(
                                                "Terjadi Kesalahan :(",
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: semiBold),
                                              ),
                                            );
                                          }
                                          return Container();
                                        },
                                      ),
                                    )
                                  ] else if (userType == "seller") ...[
                                    BlocProvider(
                                      create: (context) => TransaksiBloc()
                                        ..add(TransaksiGetDetailSeller(
                                            widget.transactionId)),
                                      child: BlocBuilder<TransaksiBloc,
                                          TransaksiState>(
                                        builder: (context, state) {
                                          if (state
                                              is DetailTransaksiSellerGetSuccess) {
                                            var detailTransaksi = state
                                                .detailTransaksiSeller!.data;
                                            return Expanded(
                                                flex: 2,
                                                child: Container(
                                                  child: Row(children: [
                                                    Flexible(
                                                      child: Text(
                                                        detailTransaksi.weight
                                                            .toString(),
                                                        style: blueTextStyle
                                                            .copyWith(
                                                                fontSize: 48,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          12),
                                                              child: Row(
                                                                children: [
                                                                  Text("dari"),
                                                                  const SizedBox(
                                                                    width: 2,
                                                                  ),
                                                                  Text(
                                                                    detailTransaksi
                                                                        .maximumWeight
                                                                        .toString(),
                                                                    style: blueTextStyle.copyWith(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ]),
                                                    )),
                                                  ]),
                                                ));
                                          }
                                          if (state
                                              is DetailTransaksiSellerFailed) {
                                            return Center(
                                              child: Text(
                                                "Terjadi Kesalahan :(",
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: semiBold),
                                              ),
                                            );
                                          }
                                          return Container();
                                        },
                                      ),
                                    )
                                  ]
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
                      if (userType == "buyer") ...[
                        BlocProvider(
                          create: (context) => TransaksiBloc()
                            ..add(
                                TransaksiGetDetailBuyer(widget.transactionId)),
                          child: BlocBuilder<TransaksiBloc, TransaksiState>(
                            builder: (context, state) {
                              if (state is DetailTransaksiBuyerGetSuccess) {
                                var detailTransaksi =
                                    state.detailTransaksiBuyer!.data;
                                return Flexible(
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
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 21),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "0 kg",
                                            style: blueTextStyle.copyWith(
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "${detailTransaksi.maximumWeight} kg",
                                            style: blueTextStyle.copyWith(
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    )),
                                  ]),
                                ));
                              }
                              if (state is DetailTransaksiBuyerFailed) {
                                return Center(
                                  child: Text(
                                    "Terjadi Kesalahan :(",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 16, fontWeight: semiBold),
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                        )
                      ] else if (userType == "seller") ...[
                        BlocProvider(
                          create: (context) => TransaksiBloc()
                            ..add(
                                TransaksiGetDetailSeller(widget.transactionId)),
                          child: BlocBuilder<TransaksiBloc, TransaksiState>(
                            builder: (context, state) {
                              if (state is DetailTransaksiSellerGetSuccess) {
                                return Flexible(
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
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 21),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "0 Kg",
                                            style: blueTextStyle.copyWith(
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "${state.detailTransaksiSeller!.data.maximumWeight.toString()} Kg",
                                            style: blueTextStyle.copyWith(
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    )),
                                  ]),
                                ));
                              }
                              if (state is DetailTransaksiSellerFailed) {
                                return Center(
                                  child: Text(
                                    "Terjadi Kesalahan :(",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 16, fontWeight: semiBold),
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                        )
                      ]
                    ]),
                  )),
                  if (userType == "buyer") ...[
                    BlocProvider(
                      create: (context) => TransaksiBloc()
                        ..add(TransaksiGetDetailBuyer(widget.transactionId)),
                      child: BlocConsumer<TransaksiBloc, TransaksiState>(
                        listener: (context, state) {
                          if (state is AksiTransaksiBuyerGetSuccess) {
                            Navigator.pop(context);
                          }
                        },
                        builder: (context, state) {
                          if (state is DetailTransaksiBuyerGetSuccess) {
                            var detailTransaksi =
                                state.detailTransaksiBuyer!.data;
                            return Flexible(
                                child: Container(
                              child: Row(children: [
                                Expanded(
                                    child: Container(
                                        child: GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: 144,
                                    height: 50,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))),
                                      onPressed: () {
                                        //TODO: Tolak
                                        status = 4;
                                        print("TOLAK: Status ${status}");
                                        context.read<TransaksiBloc>().add(
                                            AksiTransaksiGetBuyer(
                                                widget.transactionId, status));
                                      },
                                      child: Text(
                                        "Tolak",
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 16, fontWeight: semiBold),
                                      ),
                                    ),
                                  ),
                                ))),
                                SizedBox(
                                  width: 12,
                                ),
                                Flexible(
                                    child: Container(
                                  child: Container(
                                      child: GestureDetector(
                                    onTap: () {},
                                    child: SizedBox(
                                      width: 144,
                                      height: 50,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        onPressed: () {
                                          //TODO: Terima
                                          status = 1;
                                          print("TERIMA: Status ${status}");
                                          context.read<TransaksiBloc>().add(
                                              AksiTransaksiGetBuyer(
                                                  widget.transactionId,
                                                  status));
                                        },
                                        child: Text(
                                          "Terima",
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: semiBold),
                                        ),
                                      ),
                                    ),
                                  )),
                                ))
                              ]),
                            ));
                          }
                          if (state is DetailTransaksiBuyerFailed) {
                            return Center(
                              child: Text(
                                "Terjadi Kesalahan :(",
                                style: blackTextStyle.copyWith(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    )
                  ],
                  const SizedBox(
                    height: 12,
                  ),
                  if (userType == "buyer") ...[
                    BlocProvider(
                      create: (context) => TransaksiBloc()
                        ..add(TransaksiGetDetailBuyer(widget.transactionId)),
                      child: BlocConsumer<TransaksiBloc, TransaksiState>(
                        listener: (context, state) {
                          if (state is AksiTransaksiBuyerGetSuccess) {
                            Navigator.pop(context);
                          }
                        },
                        builder: (context, state) {
                          if (state is DetailTransaksiBuyerGetSuccess) {
                            var detailTransaksi =
                                state.detailTransaksiBuyer!.data;
                            return Flexible(
                                flex: 4,
                                child: Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 17, vertical: 16),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Nama Iklan",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  detailTransaksi.title
                                                      .toString(),
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Kategori",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  detailTransaksi.category
                                                      .toString(),
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Spesifikasi",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  detailTransaksi
                                                      .additionalInformation
                                                      .toString(),
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20),
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
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Tanggal Kadaluarsa",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "-",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Berat Minimum",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.minimumWeight} g",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Berat Maksimum",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.minimumWeight} kg",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Pendapatan",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "+ Rp${detailTransaksi.price},- / kg",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20),
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
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Berat yang Diberikan",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.weight} kg",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Lokasi",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.location}",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Sistem",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.retrievalSystem}",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Total Pendapatan",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "+Rp. ${detailTransaksi.totalPrice}",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ]),
                                        ),
                                      ]),
                                ));
                          }
                          if (state is DetailTransaksiBuyerFailed) {
                            return Center(
                              child: Text(
                                "Terjadi Kesalahan :(",
                                style: blackTextStyle.copyWith(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    )
                  ] else if (userType == "seller") ...[
                    BlocProvider(
                      create: (context) => TransaksiBloc()
                        ..add(TransaksiGetDetailSeller(widget.transactionId)),
                      child: BlocConsumer<TransaksiBloc, TransaksiState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is DetailTransaksiSellerGetSuccess) {
                            var detailTransaksi =
                                state.detailTransaksiSeller!.data;
                            return Flexible(
                                flex: 4,
                                child: Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 17, vertical: 16),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Nama Iklan",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.title}",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Kategori",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.category}",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Spesifikasi",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.additionalInformation}",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20),
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
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Tanggal Kadaluarsa",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "-",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Berat Minimum",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.minimumWeight} g",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Berat Maksimum",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.minimumWeight} kg",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Pendapatan",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "+ Rp${detailTransaksi.price},- / kg",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20),
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
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Berat yang Diberikan",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.weight} kg",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Lokasi",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.location}",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Sistem",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "${detailTransaksi.retrievalSystem}",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Total Pendapatan",
                                                  style: whiteTextStyle,
                                                ),
                                                Text(
                                                  "+Rp. ${detailTransaksi.totalPrice}",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ]),
                                        ),
                                      ]),
                                ));
                          }
                          if (state is DetailTransaksiBuyerFailed) {
                            return Center(
                              child: Text(
                                "Terjadi Kesalahan :(",
                                style: blackTextStyle.copyWith(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    )
                  ],
                  if (userType == "seller") ...[
                    const SizedBox(height: 30),
                    BlocProvider(
                      create: (context) => TransaksiBloc()
                        ..add(AksiTransaksiGetSeller(widget.transactionId)),
                      child: BlocConsumer<TransaksiBloc, TransaksiState>(
                        listener: (context, state) {
                          // TODO: implement listener
                          if (state is AksiTransaksiGetSeller) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                HolderPage.routeName, (route) => false);
                          }
                        },
                        builder: (context, state) {
                          if (state is AksiTransaksiLoading) {
                            print("Loading");
                          }
                          if (state is AksiTransaksiSellerGetSuccess) {
                            print("Hello");
                            return GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: blueColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  onPressed: () {
                                    context.read<TransaksiBloc>().add(
                                        AksiTransaksiGetSeller(
                                            widget.transactionId));
                                  },
                                  child: Text(
                                    "Batalkan Penawaran",
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 16, fontWeight: semiBold),
                                  ),
                                ),
                              ),
                            );
                          }
                          if (state is AksiTransaksiSellerFailed) {
                            print("Failed");
                          }
                          return Container();
                        },
                      ),
                    )
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
