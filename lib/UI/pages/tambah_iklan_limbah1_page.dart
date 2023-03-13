import 'package:flutter/material.dart';
import 'package:salv/UI/pages/pencairan_poin_page.dart';
import 'package:salv/UI/pages/tambah_iklan_limbah2_page.dart';
import 'package:salv/models/iklan_form_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../common/common.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class TambahIklanLimbah1Page extends StatefulWidget {
  int step;
  static const routeName = '/tambahiklanlimbah1';
  TambahIklanLimbah1Page({super.key, required this.step});

  @override
  State<TambahIklanLimbah1Page> createState() => _TambahIklanLimbah1PageState();
}

class _TambahIklanLimbah1PageState extends State<TambahIklanLimbah1Page> {
  // int step = 1;

  final TextEditingController namaController = TextEditingController(text: '');
  final TextEditingController lokasiController =
      TextEditingController(text: '');

  dynamic kategoriLimbah;
  dynamic sistem;
  List<String> listKategoriLimbah = ["Buah-buahan", "Sayur-sayuran"];
  List<String> listSistemPengambilan = [
    "Diantar pemilik Limbah",
    "Diambil di pemilik limbah"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.widget.step;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Tambah Iklan Limbah")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                  currentStep: widget.step,
                )
              ]),
            ),
            const SizedBox(
              height: 51,
            ),
            Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      title: "Nama Iklan",
                      controller: namaController,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          "Kategori Limbah",
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
                      items: listKategoriLimbah.map((dynamic val) {
                        return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          kategoriLimbah = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    //NOTE: EMAIL INPUT
                    Row(
                      children: [
                        Text(
                          "Sistem Pengambilan Limbah",
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
                      items: listSistemPengambilan.map((dynamic val) {
                        return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          sistem = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      title: "Lokasi Pengambilan",
                      controller: lokasiController,
                    ),
                    SizedBox(
                      height: 52,
                    ),
                    CustomFilledButton(
                      title: "Selanjutnya",
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TambahIklanLimbah2Page(
                              step2: 2,
                              iklan: TambahIklanForm(
                                  nama: namaController.text,
                                  kategori: kategoriLimbah,
                                  sistem: sistem,
                                  lokasi: lokasiController.text),
                            );
                          },
                        ));
                      },
                    )
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
