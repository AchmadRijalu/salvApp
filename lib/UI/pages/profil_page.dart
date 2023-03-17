import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salv/UI/pages/pencairan_poin_page.dart';
import 'package:salv/UI/pages/sign_in_page.dart';
import 'package:salv/UI/pages/topup_point_page.dart';
import 'package:salv/UI/pages/ubah_data_alamat_page.dart';
import 'package:salv/UI/pages/ubah_data_profil_page.dart';

import 'package:salv/common/common.dart';
import 'package:salv/shared/shared_methods.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../widgets/profil_menu_widget.dart';

class ProfilPage extends StatelessWidget {
  static const routeName = '/profil';
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // TODO: implement listener

            if (state is AuthFailed) {
              showCustomSnacKbar(context, state.e);
            }

            if (state is AuthInitial) {
              Navigator.pushNamedAndRemoveUntil(
                  context, SigninPage.routeName, (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(color: greenColor),
              );
            }

            if (state is AuthSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  child: ListView(children: [
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Profil",
                          style: blueTextStyle.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 22),
                      child: Column(children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/image/image_profilepng.png"))),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          state.user!.username!,
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: medium),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PencairanPoinPage.routeName);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Poin: Rp.0",
                                style: blackTextStyle.copyWith(
                                    fontSize: 18, fontWeight: medium),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ProfileMenu(
                          iconUrl: "assets/image/icon_profil.svg",
                          title: "Ubah Data Profil",
                          ontap: () {
                            Navigator.pushNamed(
                                context, UbahDataProfilPage.routeName);
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, TopupPointPage.routeName);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: Row(children: [
                              Icon(Icons.wallet),
                              const SizedBox(
                                width: 18,
                              ),
                              Text(
                                "Topup",
                                style: blackTextStyle.copyWith(
                                    fontSize: 14, fontWeight: medium),
                              )
                            ]),
                          ),
                        ),
                        ProfileMenu(
                          iconUrl: "assets/image/icon_location.svg",
                          title: "Ubah Data Alamat",
                          ontap: () {
                            Navigator.pushNamed(
                                context, UbahDataAlamatPage.routeName);
                          },
                        ),
                        ProfileMenu(
                          iconUrl: "assets/image/icon_help.svg",
                          title: "Hubungi Kami",
                          ontap: () {},
                        ),
                        ProfileMenu(
                          iconUrl: "assets/image/icon_logout.svg",
                          title: "Logout",
                          ontap: () {
                            context.read<AuthBloc>().add(AuthLogout());
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, SigninPage.routeName, (route) => false);
                          },
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 87,
                    ),
                  ]),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
