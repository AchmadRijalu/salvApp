import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/sign_up_wilayah_2_page.dart';

import '../../common/common.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class SignupWilayahPage extends StatefulWidget {
  static const routeName = '/singupwilayah';
  const SignupWilayahPage({super.key});

  @override
  State<SignupWilayahPage> createState() => _SignupWilayahPageState();
}

class _SignupWilayahPageState extends State<SignupWilayahPage> {
  final TextEditingController provinsiController =
      TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController katasandiController =
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
                CustomDropDownFormFilled(
                  title: "Kota",
                  listOfValue: listOfValue,
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomDropDownFormFilled(
                  title: "Kecamatan",
                  listOfValue: listOfValue,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomFilledButton(
                  title: "Selanjutnya",
                  onPressed: () {
                    Navigator.pushNamed(context, SignupWilayah2Page.routeName);
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
