import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/sign_up_wilayah_page.dart';

import '../../common/common.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signup';
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nomorteleponController =
      TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController katasandiController =
      TextEditingController(text: '');

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
                  "Mulai bersihkan \nlingkungan dengan \nbergabung bersama kami",
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
                CustomFormField(title: "Nama Pengguna / Username"),
                const SizedBox(
                  height: 18,
                ),
                CustomFormField(
                  title: "Kata Sandi",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomFormField(
                  title: "Nomor Telepon",
                  keyBoardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomFilledButton(
                  title: "Selanjutnya",
                  onPressed: () {
                    Navigator.pushNamed(context, SignupWilayahPage.routeName);
                  },
                ),
                const SizedBox(
                  height: 17,
                )
              ]),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(top: 18),
              child: Column(children: [
                CustomTextButton(
                  title: "Sudah Punya Akun?",
                  onPressed: () => Navigator.pop(context),
                )
              ]),
            ))
          ]),
        ),
      ),
    );
  }
}
