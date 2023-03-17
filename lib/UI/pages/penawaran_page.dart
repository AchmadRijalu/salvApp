import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salv/UI/pages/detail_iklan_page.dart';
import 'package:salv/UI/pages/detail_penawaran_page.dart';
import 'package:salv/UI/widgets/list_penawaran_widget.dart';
import 'package:salv/blocs/iklan/iklan_bloc.dart';
import 'package:salv/blocs/transaksi/transaksi_bloc.dart';
import 'package:salv/common/common.dart';

import '../../blocs/auth/auth_bloc.dart';

class PenawaranPage extends StatefulWidget {
  static const routeName = '/penawaran';
  const PenawaranPage({super.key});

  @override
  State<PenawaranPage> createState() => _PenawaranPageState();
}

class _PenawaranPageState extends State<PenawaranPage> {
  dynamic userId;
  dynamic userType;
  @override
  void initState() {
    // TODO: implement initState
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
                //TODO: UI for buyers
                if (userType == "buyer") ...[
                  BlocProvider(
                    create: (context) =>
                        TransaksiBloc()..add(TransaksiGetAllBuyer(userId)),
                    child: BlocBuilder<TransaksiBloc, TransaksiState>(
                      builder: (context, state) {
                        if (state is TransaksiLoading) {
                          return Container(
                              margin: const EdgeInsets.only(top: 40),
                              child: Center(
                                child: CircularProgressIndicator(
                                    color: greenColor),
                              ));
                        }
                        if (state is TransaksiBuyerGetSuccess) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.transaksiBuyer!.data.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var transaksi =
                                    state.transaksiBuyer!.data[index];
                                return ListPenawaran(
                                  gambar: "assets/image/image_profilepng.png",
                                  namaLimbah: transaksi.title,
                                  beratLimbah: "+${transaksi.weight} kg",
                                  statusPenawaran: transaksi.status == 0
                                      ? "Respon"
                                      : transaksi.status == 1
                                          ? "Diterima"
                                          : transaksi.status == 2
                                              ? "Konfirmasi"
                                              : transaksi.status == 3
                                                  ? "Dibatalkan"
                                                  : "Ditolak",
                                  tanggal: transaksi.createdAt.substring(4, 16),
                                  username: transaksi.mahasiswa,
                                  onTap: () {
                                    print(transaksi.status);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return DetailPenawaranPage(
                                        statusPenawaran: transaksi.status,
                                        transactionId: transaksi.id,
                                      );
                                    })).then((value){
                                      setState(() {
                                        
                                      });
                                    });
                                  },
                                );
                              });
                        }
                        if (state is TransaksiFailed) {
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

                //TODO: UI for sellers
                else if (userType == "seller") ...[
                  BlocProvider(
                    create: (context) =>
                        TransaksiBloc()..add(TransaksiGetAllSeller(userId)),
                    child: BlocBuilder<TransaksiBloc, TransaksiState>(
                      builder: (context, state) {
                        if (state is TransaksiLoading) {
                          return Container(
                              margin: const EdgeInsets.only(top: 40),
                              child: Center(
                                child: CircularProgressIndicator(
                                    color: greenColor),
                              ));
                        }
                        if (state is TransaksiSellerGetSuccess) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.transaksiSeller!.data.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (content, index) {
                                var transaksi =
                                    state.transaksiSeller!.data[index];
                                //kirim data ke detail untuk statusnya
                                var statusType = transaksi.status;
                                return ListPenawaran(
                                  gambar: "assets/image/image_profilepng.png",
                                  namaLimbah: transaksi.title,
                                  beratLimbah: "+ Rp.${transaksi.totalPrice}",
                                  statusPenawaran: transaksi.status == 0
                                      ? "Menunggu Konfirmasi"
                                      : transaksi.status == 1
                                          ? "Diterima"
                                          : transaksi.status == 2
                                              ? "Sedang Berlangsung"
                                              : transaksi.status == 3
                                                  ? "Dibatalkan"
                                                  : "Ditolak",
                                  tanggal: transaksi.createdAt.substring(4, 16),
                                  username: transaksi.pabrik,
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return DetailPenawaranPage(
                                        transactionId: transaksi.id,
                                        statusPenawaran: statusType,
                                      );
                                    })).then((value){
                                      setState(() {
                                        
                                      });
                                    });
                                  },
                                );
                              });
                        }
                        if (state is TransaksiFailed) {
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
              ])),
            ))
          ]),
        ),
      ),
    );
  }
}
