import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/holder_page.dart';
import 'package:salv/UI/pages/sign_up_page.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/UI/widgets/forms.dart';

import '../../common/common.dart';

class SigninPage extends StatefulWidget {
  static const routeName = '/signin';
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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
                  "Wah, limbah makanan \nmana yang ingin Anda cari \ntahu, yuk lihat-lihat!",
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
                CustomFormField(title: "Nama Pengguna"),
                const SizedBox(
                  height: 17,
                ),
                CustomFormField(title: "Kata Sandi"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Lupa Kata Sandi?",
                      style: greenTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomFilledButton(
                  title: "Sign In",
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HolderPage.routeName, (route) => false);
                  },
                ),
                const SizedBox(
                  height: 17,
                )
              ]),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(top: 81),
              child: Column(children: [
                CustomTextButton(
                  title: "Buat Akun Baru",
                  onPressed: () =>
                      Navigator.pushNamed(context, SignupPage.routeName),
                )
              ]),
            ))
          ]),
        ),
      ),
    );
  }
}
