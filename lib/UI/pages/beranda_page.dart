import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salv/UI/pages/beranda_detail.dart';
import 'package:salv/UI/widgets/list_limbah_widget.dart';
import 'package:salv/blocs/auth/auth_bloc.dart';
import 'package:salv/blocs/beranda/beranda_bloc.dart';
import 'package:salv/common/common.dart';

class BerandaPage extends StatefulWidget {
  static const routeName = '/beranda';
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
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
                        "Wah, limbah makanan \nmana yang paling sering \nAnda jual?  Yuk lihat-lihat!",
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
                  if (userType == "seller") ...[
                    BlocProvider(
                      create: (context) =>
                          BerandaBloc()..add(BerandaGetAllSeller(userId)),
                      child: BlocBuilder<BerandaBloc, BerandaState>(
                        builder: (context, state) {
                          if (state is BerandaLoading) {
                            return Container(
                                margin: const EdgeInsets.only(top: 40),
                                child: Center(
                                  child: CircularProgressIndicator(
                                      color: greenColor),
                                ));
                          }
                          if (state is BerandaSellerGetSuccess) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.berandaSeller!.data.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  var berandaSeller =
                                      state.berandaSeller!.data[index];
                                  return LimbahBerandaPage(
                                    title: berandaSeller.category,
                                    price: berandaSeller.finishedWeight,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, BerandaDetailPage.routeName);
                                    },
                                  );
                                });
                          }
                          if (state is BerandaFailed) {
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
                  ] else if (userType == "buyer") ...[
                    BlocProvider(
                      create: (context) =>
                          BerandaBloc()..add(BerandaGetAllBuyer(userId)),
                      child: BlocBuilder<BerandaBloc, BerandaState>(
                        builder: (context, state) {
                          if (state is BerandaLoading) {
                            return Container(
                                margin: const EdgeInsets.only(top: 40),
                                child: Center(
                                  child: CircularProgressIndicator(
                                      color: greenColor),
                                ));
                          }
                          if (state is BerandaBuyerGetSuccess) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.berandaBuyer!.data.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                var berandaBuyer =
                                    state.berandaBuyer!.data[index];
                                return LimbahBerandaPage(
                                  title: "${berandaBuyer.category}",
                                  price: berandaBuyer.finishedWeight,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, BerandaDetailPage.routeName);
                                  },
                                );
                              },
                            );
                          }
                          if (state is BerandaFailed) {
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
          )))
        ]),
      ),
    ));
  }
}
