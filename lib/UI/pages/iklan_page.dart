import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/detail_iklan_page.dart';
import 'package:salv/UI/widgets/list_iklan_widget.dart';

import '../../common/common.dart';

class IklanPage extends StatelessWidget {
  static const routeName = '/iklan';
  const IklanPage({super.key});

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
              height: 44,
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
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ListIklan(
                          onTap: () {
                            Navigator.pushNamed(
                                context, DetailIklanPage.routeName);
                          },
                          title:
                              "Butuh Wortel Busuk dan ayam utuh cabe utuh yayg",
                        ),
                        ListIklan(
                          title: "Butuh Semangka Busuk",
                        ),
                        ListIklan(
                          title: "Butuh Semangka Busuk",
                        ),
                        ListIklan(
                          title: "Butuh Semangka Busuk",
                        )
                      ],
                    )
                  ]),
            )))
          ],
        )),
      ),
    );
  }
}
