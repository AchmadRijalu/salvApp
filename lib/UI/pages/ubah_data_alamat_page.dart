import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../common/common.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class UbahDataAlamatPage extends StatefulWidget {
  static const routeName = '/ubahdataalamat';
  UbahDataAlamatPage({
    super.key,
  });

  @override
  State<UbahDataAlamatPage> createState() => _UbahDataAlamatPageState();
}

class _UbahDataAlamatPageState extends State<UbahDataAlamatPage> {
  List<String> listOfValue = ["Provinsi", "Kota", "Kecamatan", "Kelurahan"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Data Alamat"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(children: [
          const SizedBox(
            height: 30,
          ),
          Container(
              padding: const EdgeInsets.all(22),
              margin: const EdgeInsets.only(bottom: 54),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropDownFormFilled(
                      title: "Provinsi", listOfValue: listOfValue),
                  SizedBox(
                    height: 16,
                  ),
                  CustomDropDownFormFilled(
                      title: "Kota", listOfValue: listOfValue),
                  SizedBox(
                    height: 16,
                  ),
                  //NOTE: EMAIL INPUT
                  CustomDropDownFormFilled(
                      title: "Kecamatan", listOfValue: listOfValue),
                  SizedBox(
                    height: 16,
                  ),
                  //NOTE: EMAIL INPUT
                  CustomDropDownFormFilled(
                      title: "Kelurahan", listOfValue: listOfValue),
                  SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    title: "Kode Pos",
                    keyBoardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomFormField(title: "Alamat Lengkap"),
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
        ]),
      ),
    );
  }
}
