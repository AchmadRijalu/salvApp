import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/sign_up_wilayah_page.dart';
import 'package:salv/models/sign_up_form_model.dart';
import 'package:salv/services/region_service.dart';
import 'package:salv/shared/shared_methods.dart';

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
  SignupFormModel? data;
  List<String> listTipe = ["buyer", "seller"];
  final TextEditingController nomorteleponController =
      TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController katasandiController =
      TextEditingController(text: '');

  dynamic tipe;

  bool validate() {
    if (nomorteleponController.text.isEmpty ||
        usernameController.text.isEmpty ||
        katasandiController.text.isEmpty ||
        tipe == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 37),
        child: Container(
          child: ListView(children: [
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
                CustomFormField(
                  title: "Nama Pengguna / Username",
                  controller: usernameController,
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomFormField(
                  title: "Kata Sandi",
                  controller: katasandiController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomFormField(
                  controller: nomorteleponController,
                  title: "Nomor Telepon",
                  keyBoardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Text(
                      "Tipe",
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      focusColor: greenColor,
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  items: listTipe.map((dynamic val) {
                    return DropdownMenuItem(
                      value: val,
                      child: Text(
                        val,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      tipe = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomFilledButton(
                  title: "Selanjutnya",
                  onPressed: () {
                    if (validate()) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignupWilayahPage(
                              data: SignupFormModel(
                                  username: usernameController.text,
                                  name: usernameController.text,
                                  password: katasandiController.text,
                                  phone: nomorteleponController.text));
                        },
                      ));
                    } else {
                      showCustomSnacKbar(context, "Form tidak boleh kosong");
                    }
                    // Navigator.pushNamed(context, SignupWilayahPage.routeName);
                  },
                ),
                const SizedBox(
                  height: 17,
                )
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 18),
              child: Column(children: [
                CustomTextButton(
                  title: "Sudah Punya Akun?",
                  onPressed: () => Navigator.pop(context),
                )
              ]),
            ),
            const SizedBox(
              height: 12,
            )
          ]),
        ),
      ),
    );
  }
}
