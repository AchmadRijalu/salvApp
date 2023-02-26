import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:salv/common/common.dart';

class ListIklan extends StatelessWidget {
  late String? title;
  final VoidCallback? onTap;
  ListIklan({super.key, this.title, this.onTap});

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
                                                fontSize: 16),
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
                                    children: [
                                      Flexible(
                                          child: Row(
                                        children: [
                                          Text(
                                            "+Rp. 20.000/kg",
                                            style: whiteTextStyle.copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10),
                                          )
                                        ],
                                      )),
                                      Flexible(
                                          child: Container(
                                        margin: const EdgeInsets.only(top: 2),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Terkumpul ",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 10),
                                            ),
                                            Text("242",
                                                style: whiteTextStyle.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 10)),
                                            Text(" Kg",
                                                style: whiteTextStyle.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 10)),
                                            Text(
                                              "/ 350 kg ",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ))
                                    ]),
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
                  Flexible(
                      child: Container(
                    margin: const EdgeInsets.only(left: 9),
                    child: LinearPercentIndicator(
                      lineHeight: 27,
                      percent: 0.5,
                      animation: true,
                      progressColor: blueColor,
                      backgroundColor: greyColor,
                      barRadius: Radius.circular(8),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(right: 20, left: 21),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "0 Kg",
                          style: whiteTextStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          "450Kg",
                          style: whiteTextStyle.copyWith(fontSize: 16),
                        )
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
