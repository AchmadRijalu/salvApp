import 'package:flutter/material.dart';
import 'package:salv/UI/pages/pencairan_poin_page.dart';
import 'package:salv/UI/pages/tambah_iklan_limbah2_page.dart';
import 'package:salv/models/iklan_form_model.dart';
import 'package:salv/models/kategori_limbah_model.dart';
import 'package:salv/services/kategori_limbah_services.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../common/common.dart';
import '../../shared/shared_methods.dart';
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

  late Future<KategoriLimbah> provinceList;
  dynamic kategoriLimbah;
  late Future<KategoriLimbah> kategoriLimbahList;
  dynamic sistem;
  dynamic sistemNumber;

  List<String> listKategoriLimbah = ["Buah-buahan", "Sayur-sayuran"];
  List<String> listSistemPengambilan = [
    "Diantar pemilik Limbah",
    "Diambil di pemilik limbah"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    kategoriLimbahList = KategoriLimbahService().getKategoriLimbah();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  bool validate() {
    if (namaController.text.isEmpty ||
        kategoriLimbah == null ||
        sistemNumber == null) {
      return false;
    }
    return true;
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
                    Container(
                      child: FutureBuilder(
                        future: kategoriLimbahList,
                        builder:
                            ((context, AsyncSnapshot<KategoriLimbah> snapshot) {
                          var state = snapshot.connectionState;
                          if (state != ConnectionState.done) {
                            return DropdownButtonFormField(
                              hint: Text("Tunggu Sebentar.."),
                              decoration: InputDecoration(
                                  focusColor: greenColor,
                                  contentPadding: const EdgeInsets.all(12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              items: [],
                              onChanged: (value) {},
                            );
                          } else {
                            if (snapshot.hasData) {
                              return DropdownButtonFormField(
                                hint: kategoriLimbah == null
                                    ? Text("Pilih Kategori Limbah")
                                    : Text(kategoriLimbah.toString()),
                                value: kategoriLimbah,
                                isExpanded: true,
                                onChanged: (value) {
                                  setState(() {
                                    kategoriLimbah = value;
                                  });
                                },
                                decoration: InputDecoration(
                                    focusColor: greenColor,
                                    contentPadding: const EdgeInsets.all(12),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                items: snapshot.data!.data.map((val) {
                                  return DropdownMenuItem(
                                    value: val,
                                    child: Text(
                                      val.name,
                                    ),
                                  );
                                }).toList(),
                              );
                            } else if (snapshot.hasError) {
                              return DropdownButtonFormField(
                                hint: Text("No Internet"),
                                decoration: InputDecoration(
                                    focusColor: greenColor,
                                    contentPadding: const EdgeInsets.all(12),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                items: [],
                                onChanged: (value) {},
                              );
                            } else {
                              return const Material(
                                child: Text(""),
                              );
                            }
                          }
                        }),
                      ),
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
                          if (sistem == "Diantar pemilik Limbah") {
                            sistemNumber = 0;
                          } else {
                            sistemNumber = 1;
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    SizedBox(
                      height: 52,
                    ),
                    CustomFilledButton(
                      title: "Selanjutnya",
                      onPressed: () {
                        if (validate()) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return TambahIklanLimbah2Page(
                                step2: 2,
                                iklan: TambahIklanForm(
                                  name: namaController.text,
                                  foodWasteCategoryId: kategoriLimbah.id,
                                  retrievalSystem: sistemNumber,
                                ),
                              );
                            },
                          ));
                        } else {
                          showCustomSnacKbar(
                              context, "Form tidak boleh kosong");
                        }
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
