import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:salv/UI/pages/form_jual_limbah_page.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/blocs/iklan/iklan_bloc.dart';
import 'package:salv/common/common.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../models/jual_limbah_form_model.dart';
import '../../models/user_model.dart';
import '../../shared/shared_methods.dart';
import 'holder_page.dart';

class DetailIklanPage extends StatefulWidget {
  final String? advertisementId;
  final dynamic? iklanProgress;
  final dynamic maxProgress;
  DetailIklanPage(
      {super.key, this.advertisementId, this.iklanProgress, this.maxProgress});
  static const routeName = '/detailiklan';

  @override
  State<DetailIklanPage> createState() => _DetailIklanPageState();
}

class _DetailIklanPageState extends State<DetailIklanPage> {
  @override
  dynamic userId;
  dynamic userType;
  JualLimbahForm? jualLimbahForm;

  void initState() {
    // TODO: implement initState

    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      userType = authState.user!.type;
      userId = authState.user!.id;
      print(" ADS ID:${widget.advertisementId}");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail Iklan")),
        body: userType == "buyer"
            ? BlocProvider(
                create: (context) => IklanBloc()
                  ..add(IklanGetDetailBuyer(widget.advertisementId)),
                child: BlocConsumer<IklanBloc, IklanState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is IklanFailed) {
                      showCustomSnacKbar(context, state.e);
                    }
                  },
                  builder: (context, state) {
                    if (state is IklanBuyerGetDetailSuccess) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 36, vertical: 14),
                        child: Container(
                          child: CustomScrollView(
                            slivers: [
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Column(children: [
                                  //Only for Mahasiswa

                                  // if pabrik
                                  Flexible(
                                      flex: userType == "buyer" ? 2 : 4,
                                      child: Container(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 17,
                                                        vertical: 16),
                                                decoration: BoxDecoration(
                                                    color: greenColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
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
                                                        state.iklanBuyerDetail!
                                                            .data.title,
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        state.iklanBuyerDetail!
                                                            .data.category,
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        "Ketersediaan Sistem",
                                                        style: whiteTextStyle,
                                                      ),
                                                      Text(
                                                        state.iklanBuyerDetail!.data
                                                                    .retrievalSystem
                                                                    .toString() ==
                                                                0
                                                            ? "Diantar pemilik Limbah"
                                                            : "Diambil di pemilik limbah",
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        "Lokasi Tujuan",
                                                        style: whiteTextStyle,
                                                      ),
                                                      Text(
                                                        state.iklanBuyerDetail!
                                                            .data.location,
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        state
                                                            .iklanBuyerDetail!
                                                            .data
                                                            .additionalInformation,
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 17,
                                                        vertical: 16),
                                                decoration: BoxDecoration(
                                                    color: greenColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(children: [
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
                                                        "${state.iklanBuyerDetail!.data.minimumWeight.toString()} kg",
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        "${state.iklanBuyerDetail!.data.maximumWeight.toString()} kg",
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        "Pengeluaran",
                                                        style: whiteTextStyle,
                                                      ),
                                                      Text(
                                                        "${state.iklanBuyerDetail!.data.price.toString()},- / Kilogram",
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      )
                                                    ],
                                                  ),
                                                ]),
                                              ),
                                              const SizedBox(
                                                height: 50,
                                              ),
                                              if (widget.advertisementId !=
                                                  "") ...[
                                                Container(
                                                  width: double.infinity,
                                                  height: 160,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12),
                                                  decoration: BoxDecoration(
                                                      color: greenColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Column(children: [
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Tidak ada Batas Kadaluarsa",
                                                          style: whiteTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      semiBold,
                                                                  fontSize: 12),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 12,
                                                    ),
                                                    Flexible(
                                                        child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 9),
                                                      child:
                                                          LinearPercentIndicator(
                                                        trailing: Text(
                                                          "${state.iklanBuyerDetail!.data.maximumWeight.toString()} Kg",
                                                          style: whiteTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      semiBold,
                                                                  fontSize: 15),
                                                        ),
                                                        lineHeight: 11,
                                                        percent: widget
                                                            .iklanProgress,
                                                        animation: true,
                                                        progressColor:
                                                            blueColor,
                                                        backgroundColor:
                                                            greyColor,
                                                        barRadius:
                                                            Radius.circular(8),
                                                      ),
                                                    )),
                                                    const SizedBox(
                                                      height: 12,
                                                    ),
                                                    // if(state.iklanBuyerDetail!.data.)
                                                    BlocProvider(
                                                      create: (context) =>
                                                          IklanBloc(),
                                                      child: BlocConsumer<
                                                          IklanBloc,
                                                          IklanState>(
                                                        listener:
                                                            (context, state) {
                                                          // TODO: implement listener
                                                          if (state
                                                              is IklanFailed) {
                                                            showCustomSnacKbar(
                                                                context,
                                                                state.e);
                                                          }
                                                          if (state
                                                              is IklanCancelBuyerSuccess) {
                                                            Navigator
                                                                .pushNamedAndRemoveUntil(
                                                                    context,
                                                                    HolderPage
                                                                        .routeName,
                                                                    (route) =>
                                                                        false);
                                                          }
                                                        },
                                                        builder:
                                                            (context, state) {
                                                          return ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red
                                                                              .shade900),
                                                              onPressed: () {
                                                                context
                                                                    .read<
                                                                        IklanBloc>()
                                                                    .add(IklanCancelBuyer(
                                                                        widget
                                                                            .advertisementId));
                                                              },
                                                              child: Text(
                                                                "Batalkan Iklan",
                                                              ));
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              "Dibuat: 11 Februari 2021",
                                                              style: whiteTextStyle
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          medium,
                                                                      fontSize:
                                                                          9),
                                                            )
                                                          ]),
                                                    ))
                                                  ]),
                                                )
                                              ]
                                            ]),
                                      )),
                                ]),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              )
            : BlocProvider(
                create: (context) => IklanBloc()
                  ..add(IklanGetDetailSeller(widget.advertisementId)),
                child: BlocConsumer<IklanBloc, IklanState>(
                  listener: (context, state) {
                    if (state is IklanFailed) {
                      showCustomSnacKbar(context, state.e);
                    }
                  },
                  builder: (context, state) {
                    if (state is IklanSellerGetDetailSuccess) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 36, vertical: 14),
                        child: Container(
                          child: CustomScrollView(
                            slivers: [
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Column(children: [
                                  //Only for Mahasiswa

                                  Flexible(
                                      child: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${state.iklanSellerDetail!.data.ongoingWeight.toString()} / ${widget.maxProgress}",
                                              style: blueTextStyle.copyWith(
                                                  fontSize: 48,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Kg",
                                              style: blueTextStyle.copyWith(
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Iklan dibuat pada 14/04/23",
                                              style: blueTextStyle.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 29,
                                        ),
                                        Flexible(
                                            child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 9),
                                          child: LinearPercentIndicator(
                                            lineHeight: 27,
                                            percent: widget.iklanProgress,
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
                                                "${widget.maxProgress}Kg",
                                                style: blueTextStyle.copyWith(
                                                    fontSize: 16),
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

                                  // if pabrik
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 17,
                                                        vertical: 16),
                                                decoration: BoxDecoration(
                                                    color: greenColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
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
                                                        state.iklanSellerDetail!
                                                            .data.title,
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        state.iklanSellerDetail!
                                                            .data.category,
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        "Ketersediaan Sistem",
                                                        style: whiteTextStyle,
                                                      ),
                                                      Text(
                                                        state.iklanSellerDetail!.data
                                                                    .retrievalSystem
                                                                    .toString() ==
                                                                0
                                                            ? "Diantar pemilik Limbah"
                                                            : "Diambil di pemilik limbah",
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        "Lokasi Tujuan",
                                                        style: whiteTextStyle,
                                                      ),
                                                      Text(
                                                        state.iklanSellerDetail!
                                                            .data.location,
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        state.iklanSellerDetail!.data
                                                                    .additionalInformation !=
                                                                ""
                                                            ? state
                                                                .iklanSellerDetail!
                                                                .data
                                                                .additionalInformation
                                                            : "-",
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 17,
                                                        vertical: 16),
                                                decoration: BoxDecoration(
                                                    color: greenColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(children: [
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
                                                        "${state.iklanSellerDetail!.data.minimumWeight.toString()} kg",
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        "${state.iklanSellerDetail!.data.maximumWeight.toString()} kg",
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                        "Pengeluaran",
                                                        style: whiteTextStyle,
                                                      ),
                                                      Text(
                                                        "+Rp.${state.iklanSellerDetail!.data.price},- / Kilogram",
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      )
                                                    ],
                                                  ),
                                                ]),
                                              ),
                                              const SizedBox(
                                                height: 48,
                                              ),
                                              CustomFilledButton(
                                                title: "Buat Penawaran",
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                    builder: (context) {
                                                      return FormJualLimbahPage(
                                                        adsId: widget
                                                            .advertisementId,
                                                        userId: userId,
                                                      );
                                                    },
                                                  ));
                                                },
                                              )
                                            ]),
                                      )),

                                  const SizedBox(
                                    height: 23,
                                  ),

                                  if (userType == "buyer") ...[
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12),
                                                  decoration: BoxDecoration(
                                                      color: greenColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Column(children: [
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Tidak ada Batas Kadaluarsa",
                                                          style: whiteTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      semiBold,
                                                                  fontSize: 12),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 12,
                                                    ),
                                                    Flexible(
                                                        child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 9),
                                                      child:
                                                          LinearPercentIndicator(
                                                        trailing: Text(
                                                          "Kg",
                                                          style: whiteTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      semiBold,
                                                                  fontSize: 15),
                                                        ),
                                                        lineHeight: 11,
                                                        percent: widget
                                                            .iklanProgress,
                                                        animation: true,
                                                        progressColor:
                                                            blueColor,
                                                        backgroundColor:
                                                            greyColor,
                                                        barRadius:
                                                            Radius.circular(8),
                                                      ),
                                                    )),
                                                    const SizedBox(
                                                      height: 12,
                                                    ),
                                                    ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors.red
                                                                        .shade900),
                                                        onPressed: () {},
                                                        child: Text(
                                                          "Batalkan Iklan",
                                                        )),
                                                    Expanded(
                                                        child: Container(
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              "Dibuat: 11 Februari 2021",
                                                              style: whiteTextStyle
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          medium,
                                                                      fontSize:
                                                                          9),
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
                      );
                    }
                    return Container();
                  },
                ),
              ));
  }
}
