import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/holder_page.dart';

import '../../common/common.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class UbahDataProfilPage extends StatelessWidget {
  static const routeName = '/ubahdataprofil';
  const UbahDataProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Ubah Data Profil")),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomFormField(title: "Nama Pengguna / Username"),

                      SizedBox(
                        height: 16,
                      ),

                      const CustomFormField(
                        title: "Nomor Telepon",
                        keyBoardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      //NOTE: EMAIL INPUT
                      CustomFormField(
                        title: "Kata Sandi",
                        obscureText: true,
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      CustomFilledButton(
                        title: "Simpan",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
