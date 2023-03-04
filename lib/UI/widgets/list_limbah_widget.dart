import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/common/common.dart';

class LimbahBerandaPage extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  LimbahBerandaPage({super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
            color: greenColor, borderRadius: BorderRadius.circular(8)),
        height: 174,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              flex: 3,
              child: Container(
                  child: Column(
                children: [
                  Expanded(
                    child: Row(children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Column(children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 21, top: 23),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            title!,
                                            overflow: TextOverflow.clip,
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                  child: Container(
                                padding: const EdgeInsets.only(left: 21),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: []),
                              ))
                            ]),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  "assets/image/image_sampah.png",
                                  fit: BoxFit.fill,
                                )),
                          )),
                    ]),
                  ),
                ],
              ))),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: Column(children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(right: 20, left: 21),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Container(
                          child: Column(
                            children: [
                              Flexible(
                                  child: Container(
                                margin: const EdgeInsets.only(top: 2),
                                child: Row(
                                  children: [
                                    Text(
                                      "Pencapaian ",
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 10),
                                    ),
                                  ],
                                ),
                              )),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "5212",
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 32),
                                    ),
                                    Text(
                                      "Kg",
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 16),
                                    ),
                                  ]),
                            ],
                          ),
                        )),
                        Expanded(
                            child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: 34,
                                    width: 111,
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Selengkapnya",
                                          style: greenTextStyle.copyWith(),
                                        ),
                                      ],
                                    ))
                              ]),
                        ))
                      ],
                    ),
                  ))
                ]),
              ))
        ]),
      ),
    );
  }
}
