import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:salv/UI/pages/holder_page.dart';
import 'package:salv/models/iklan_form_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../common/common.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class TambahIklanLimbah3Page extends StatefulWidget {
  TambahIklanForm? iklan;
  int step3;
  TambahIklanLimbah3Page({super.key, required this.step3, this.iklan});

  @override
  State<TambahIklanLimbah3Page> createState() => _TambahIklanLimbah3PageState();
}

class _TambahIklanLimbah3PageState extends State<TambahIklanLimbah3Page> {
  final TextEditingController beratLimbahDibutuhkanController =
      TextEditingController(text: '');
  final TextEditingController beratLimbahMinimumController =
      TextEditingController(text: '');

  final TextEditingController beratLimbahMaksimumController =
      TextEditingController(text: '');
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.iklan!.nama);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  var beratLimbah = "";
  var beratMin = "";
  var beratMax = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Tambah Iklan Limbah")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  StepProgressIndicator(
                    totalSteps: 3,
                    size: 10,
                    padding: 5,
                    currentStep: widget.step3,
                  )
                ]),
              ),
              const SizedBox(
                height: 51,
              ),
              Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormField(
                        title: "Berat Limbah yang Dibutuhkan",
                        controller: beratLimbahDibutuhkanController,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        title: "Berat Limbah Minimum",
                        controller: beratLimbahMinimumController,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      //NOTE: EMAIL INPUT
                      CustomFormField(
                        title: "Berat Limbah Maksimum",
                        controller: beratLimbahMaksimumController,
                      ),
                      SizedBox(
                        height: 52,
                      ),
                      CustomFilledButton(
                        title: "Iklankan",
                        onPressed: () {
                          beratLimbah = beratLimbahDibutuhkanController.text;
                          beratMax = beratLimbahMaksimumController.text;
                          beratMin = beratLimbahMinimumController.text;

                          print(widget.iklan!.harga);
                          print(widget.iklan!.nama);
                          print(widget.iklan!.kategori);
                          print(widget.iklan!.sistem);
                          print(widget.iklan!.lokasi);
                          print(widget.iklan!.tanggalkadaluarsa);
                          print(widget.iklan!.keinginan);
                          print(beratLimbah);
                          print(beratMax);
                          print(beratMin);

                          widget.iklan = TambahIklanForm(
                              beratdibutuhkan: beratLimbah,
                              beratmaks: beratMax,
                              beratmin: beratMin);
                          print("Iklan : ${widget.iklan.toString()}");

                          Alert(
                            context: context,
                            type: AlertType.warning,
                            style: AlertStyle(
                                titleStyle: blackTextStyle.copyWith(
                                    fontWeight: bold, fontSize: 22)),
                            title: "Yakin untuk Memulai Iklan?",
                            desc:
                                "Iklan yang sudah diiklankan tidak dapat diubah",
                            buttons: [
                              DialogButton(
                                color: redColor,
                                child: Text(
                                  "Kembali",
                                  style: whiteTextStyle.copyWith(
                                      fontWeight: bold, fontSize: 16),
                                ),
                                onPressed: () {
                                  print(widget.iklan!.beratmaks);
                                  Navigator.pop(
                                    context,
                                  );
                                },
                                width: 120,
                              ),
                              DialogButton(
                                color: Colors.green,
                                child: Text(
                                  "Iklankan",
                                  style: whiteTextStyle.copyWith(
                                      fontWeight: bold, fontSize: 16),
                                ),
                                onPressed: () {
                                  listIklan.add(widget.iklan!);
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return HolderPage();
                                    },
                                  ));
                                },
                                width: 120,
                              )
                            ],
                          ).show();
                        },
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
