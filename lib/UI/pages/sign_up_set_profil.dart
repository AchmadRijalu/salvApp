import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salv/UI/pages/holder_page.dart';
import 'package:salv/UI/pages/sign_up_success_page.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/bloc/auth_bloc.dart';
import 'package:salv/models/sign_up_form_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/common.dart';
import '../../shared/shared_methods.dart';

class SignupSetProfilPage extends StatefulWidget {
  SignupFormModel? data;
  static const routeName = '/signupsetprofil';
  SignupSetProfilPage({super.key, required this.data});

  @override
  State<SignupSetProfilPage> createState() => _SignupSetProfilPageState();
}

class _SignupSetProfilPageState extends State<SignupSetProfilPage> {
  XFile? selectedImage;
  dynamic imageStringHolder = '';

  bool validate() {
    if (selectedImage == null) {
      return false;
    }

    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: lightBackgroundColor,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is AuthFailed) {
              showCustomSnacKbar(context, state.e);
            }
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, HolderPage.routeName, (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: const CircularProgressIndicator(),
              );
            }
            return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 44, horizontal: 37),
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Row(children: [Image.asset('assets/image/logo-png.png')]),
                      const SizedBox(
                        height: 53,
                      ),
                      Row(
                        children: [
                          Text(
                            "Masukkan Foto Profil \nuntuk Tanda Pengenal \nAnda",
                            style: blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Container(
                        padding: const EdgeInsets.all(35),
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final image = await selectImage();
                                  setState(() {
                                    selectedImage = image;
                                  });
                                },
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      color: lightBackgroundColor,
                                      image: selectedImage == null
                                          ? null
                                          : DecorationImage(
                                              image: FileImage(
                                                  File(selectedImage!.path))),
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: selectedImage != null
                                          ? null
                                          : Center(
                                              child: SvgPicture.asset(
                                                  "assets/image/icon_upload.svg"),
                                            )),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                widget.data!.username!,
                                style: blackTextStyle.copyWith(
                                    fontSize: 18, fontWeight: medium),
                              ),
                              const SizedBox(
                                height: 44,
                              ),
                              CustomFilledButton(
                                title: "Daftar",
                                onPressed: () {
                                  context.read<AuthBloc>().add(AuthRegister(
                                      widget.data!.copyWith(
                                          image: selectedImage == null
                                              ? ""
                                              : 'data:image/png;base64,' +
                                                  base64Encode(File(
                                                          selectedImage!.path)
                                                      .readAsBytesSync()))));
                                },
                              ),
                            ]),
                      ),
                    ])));
          },
        ));
  }
}
