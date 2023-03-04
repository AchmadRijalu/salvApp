import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/detail_iklan_pabrik_page.dart';
import 'package:salv/UI/pages/detail_iklan_page.dart';
import 'package:salv/UI/pages/tambah_iklan_limbah1_page.dart';
import 'package:salv/UI/pages/tambah_iklan_limbah2_page.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/UI/widgets/list_iklan_widget.dart';
import 'package:salv/models/iklan_model.dart';
import 'package:salv/models/user_model.dart';

import '../../common/common.dart';
import '../../models/user_model.dart';
import '../../models/user_model.dart';

class IklanPage extends StatefulWidget {
  static const routeName = '/iklan';
  const IklanPage({super.key});

  @override
  State<IklanPage> createState() => _IklanPageState();
}

class _IklanPageState extends State<IklanPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(userList.last.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37),
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 33,
            ),
            Row(children: [Image.asset('assets/image/logo-png.png')]),
            const SizedBox(
              height: 17,
            ),
            Expanded(
                child: Container(
                    child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (userList.last.type == "buyer") ...[
                      buildTambahIklan(context),
                    ],
                    // Text(userList.length.toString()),
                    Row(
                      children: [
                        Text(
                          "Lihat Iklan yang \nsedang berlangsung",
                          style: blackTextStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: listIklan.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return userList.last.type == "buyer"
                            ? ListIklanPabrik(
                                title: listIklan[index]!.nama,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, DetailIklanPage.routeName);
                                },
                              )
                            : ListIklan(
                                title: listIklan[index]!.nama,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, DetailIklanPage.routeName);
                                },
                              );
                      },
                      // ListIklanPabrik(
                      //   title: "Butuh Semangka busuk dan peyok",
                      //   onTap: () {
                      //     Navigator.pushNamed(
                      //         context, DetailIklanPage.routeName);
                      //   },
                      // )
                      //    ListIklan(
                      //   onTap: () {

                      //   },
                      //   title:
                      //       "Butuh Wortel Busuk dan ayam utuh cabe utuh yayg",
                      // ),
                    )
                  ]),
            )))
          ],
        )),
      ),
    );
  }
}

Widget buildTambahIklan(BuildContext context) {
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello",
          style: greyTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "Hello Mimi Jinhiro",
          style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 20),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          "Butuh limbah? \nYuk, buat iklan.",
          style: greenTextStyle.copyWith(fontSize: 24, fontWeight: bold),
        ),
        const SizedBox(
          height: 22,
        ),
        CustomFilledButton(
          title: "Tambah Sekarang",
          height: 37,
          onPressed: () {
            Navigator.pushNamed(context, TambahIklanLimbah1Page.routeName,
                arguments: 1);
          },
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          "Butuh limbah makanan apapun untuk keperluan anda, langsung aja buat iklan",
          style: greyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    ),
  );
}
