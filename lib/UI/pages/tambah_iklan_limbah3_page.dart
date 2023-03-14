import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:salv/UI/pages/holder_page.dart';
import 'package:salv/blocs/iklan/iklan_bloc.dart';
import 'package:salv/models/iklan_form_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../common/common.dart';
import '../../shared/shared_methods.dart';
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

  dynamic userId;
  void initState() {
    // TODO: implement initState
    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
     userId = authState.user!.id!;
     print(userId);
      
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print(widget.iklan!.name);
  }

  var beratLimbah = "";
  var beratMin = "";
  var beratMax = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Tambah Iklan Limbah")),
      body: BlocProvider(
        create: (context) => IklanBloc(),
        child: BlocConsumer<IklanBloc, IklanState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is IklanFailed) {
              showCustomSnacKbar(context, state.e);
            }
            if (state is IklanAddSuccess) {
             
             Navigator.pushNamedAndRemoveUntil(context, HolderPage.routeName, (route) => false);
            } 
          },
          builder: (context, state) {
            if (state is IklanLoading) {
              return Center(
                child: const CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                              keyBoardType: TextInputType.number,
                              isWeight: true,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomFormField(
                              title: "Berat Limbah Minimum",
                              controller: beratLimbahMinimumController,
                              keyBoardType: TextInputType.number,
                              isWeight: true,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            //NOTE: EMAIL INPUT
                            CustomFormField(
                              title: "Berat Limbah Maksimum",
                              controller: beratLimbahMaksimumController,
                              keyBoardType: TextInputType.number,
                              isWeight: true,
                            ),
                            SizedBox(
                              height: 52,
                            ),
                            CustomFilledButton(
                              title: "Iklankan",
                              onPressed: () {
                                beratLimbah =
                                    beratLimbahDibutuhkanController.text;
                                beratMax = beratLimbahMaksimumController.text;
                                beratMin = beratLimbahMinimumController.text;

                                widget.iklan = TambahIklanForm(
                                  name: widget.iklan!.name,
                                    foodWasteCategoryId:
                                        widget.iklan!.foodWasteCategoryId,
                                    userId: userId,
                                    retrievalSystem:
                                        widget.iklan!.retrievalSystem,
                                    location: widget.iklan!.location,
                                    additionalInformation:
                                        widget.iklan!.additionalInformation,
                                    price: widget.iklan!.price,
                                    requestedWeight: int.tryParse(beratLimbah),
                                    maximumWeight: int.tryParse(beratMax),
                                    minimumWeight: int.tryParse(beratMin));
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
                                        print(widget.iklan!.maximumWeight);
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
                                      context.read<IklanBloc>().add(IklanAddAds(widget.iklan));
                                      
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
            );
          },
        ),
      ),
    );
  }
}
