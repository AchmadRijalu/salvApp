import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salv/UI/pages/tambah_iklan_limbah3_page.dart';
import 'package:salv/models/iklan_form_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../common/common.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class TambahIklanLimbah2Page extends StatefulWidget {
  TambahIklanForm? iklan;
  int step2;

  TambahIklanLimbah2Page({super.key, required this.step2, this.iklan});

  @override
  State<TambahIklanLimbah2Page> createState() => _TambahIklanLimbah2PageState();
}

class _TambahIklanLimbah2PageState extends State<TambahIklanLimbah2Page> {
  final TextEditingController keinginanTambahanController =
      TextEditingController(text: '');
  final TextEditingController hargaController = TextEditingController(text: '');
  final TextEditingController lokasiController =
      TextEditingController(text: '');

  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.iklan!.foodWasteCategoryId);
    print(widget.iklan!.name);
    print(widget.iklan!.retrievalSystem);
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
                    currentStep: widget.step2,
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
                        title: "Keinginan Tambahan",
                        controller: keinginanTambahanController,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        title: "Harga",
                        controller: hargaController,
                        keyBoardType: TextInputType.number,
                        isWeight: true,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      //NOTE: EMAIL INPUT
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
                              return TambahIklanLimbah3Page(
                                step3: 3,
                                iklan: widget.iklan!.copyWith(
                                  additionalInformation:
                                      keinginanTambahanController.text,
                                  price: int.tryParse(hargaController.text),
                                  location: lokasiController.text
                                ),
                              );
                            },
                          ));
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
