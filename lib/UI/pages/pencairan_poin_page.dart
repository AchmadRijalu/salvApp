import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../common/common.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class PencairanPoinPage extends StatelessWidget {
  static const routeName = '/pencairanpoin';
  const PencairanPoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tukar Poin"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jumlah Poin",
                          style: blueTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      Text(
                        "Rp.10.000",
                        style: blueTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  const CustomFormField(title: "Bank"),
                  SizedBox(
                    height: 16,
                  ),
                  const CustomFormField(title: "Rekening Tujuan"),
                  SizedBox(
                    height: 16,
                  ),
                  //NOTE: EMAIL INPUT
                  CustomFormField(
                    title: "Tukar Poin",
                    keyBoardType: TextInputType.number,
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  CustomFilledButton(
                    title: "Proses ",
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
