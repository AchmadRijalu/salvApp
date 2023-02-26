import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/sign_up_set_profil.dart';

import '../../common/common.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class SignupWilayah2Page extends StatefulWidget {
  static const routeName = '/signupwilayah2';
  const SignupWilayah2Page({super.key});

  @override
  State<SignupWilayah2Page> createState() => _SignupWilayah2PageState();
}

class _SignupWilayah2PageState extends State<SignupWilayah2Page> {
  final TextEditingController kelurahanController =
      TextEditingController(text: '');
  final TextEditingController kodeposController =
      TextEditingController(text: '');
  final TextEditingController alamatLengkapController =
      TextEditingController(text: '');

  List<String> listOfValue = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 37),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(children: [Image.asset('assets/image/logo-png.png')]),
            const SizedBox(
              height: 53,
            ),
            Row(
              children: [
                Text(
                  "Masukkan Data \nWilayah Anda",
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 19),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(8)),
              child: Column(children: [
                CustomDropDownFormFilled(
                  title: "Provinsi",
                  listOfValue: listOfValue,
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomFormField(
                  title: "Kode Pos",
                  controller: kodeposController,
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomFormField(
                  title: "Alamat Lengkap",
                  controller: alamatLengkapController,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomFilledButton(
                  title: "Selanjutnya",
                  onPressed: () {
                    Navigator.pushNamed(context, SignupSetProfilPage.routeName);
                  },
                ),
                const SizedBox(
                  height: 17,
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
