import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/jual_limbah_success_page.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/UI/widgets/forms.dart';

import '../../common/common.dart';

class FormJualLimbahPage extends StatefulWidget {
  static const routeName = '/formjuallimbah';
  const FormJualLimbahPage({super.key});

  @override
  State<FormJualLimbahPage> createState() => _FormJualLimbahPageState();
}

class _FormJualLimbahPageState extends State<FormJualLimbahPage> {
  List<String> listOfValue = ['jne', 'tiki', 'wahana'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Data Pengiriman")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 37),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(
            children: [
              Text(
                "Hai, tunggu dulu. \nSebelum Anda \nMengirim Tawaran, \nJangan lupa untuk\n Mengisi Form di bawah ini.",
                style: blackTextStyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          CustomFormField(title: "Berat Limbah yang Diberikan"),
          const SizedBox(
            height: 22,
          ),
          CustomDropDownFormFilled(title: "Kurir", listOfValue: listOfValue),
          const SizedBox(
            height: 17,
          ),
          CustomFormField(title: "Kurir"),
          const SizedBox(
            height: 22,
          ),
          Row(
            children: [
              Text(
                "Total Pendapatan: +Rp.",
                style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.w700, fontSize: 15),
              ),
              Text(
                "200.000",
                style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.w700, fontSize: 15),
              )
            ],
          ),
          Spacer(),
          CustomFilledButton(
            title: "Kirim Penawaran",
            onPressed: () {
              Navigator.pushNamed(context, JualLimbahSuccessPage.routeName);
            },
          ),
          const SizedBox(
            height: 13,
          )
        ]),
      ),
    );
  }
}
