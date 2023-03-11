import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/sign_up_set_profil.dart';

import 'package:salv/models/sign_up_form_model.dart';
import 'package:salv/models/ward_model.dart';

import '../../common/common.dart';
import '../../services/region_service.dart';
import '../../shared/shared_methods.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class SignupWilayah2Page extends StatefulWidget {
  SignupFormModel data;
  static const routeName = '/signupwilayah2';
  SignupWilayah2Page({super.key, required this.data});

  @override
  State<SignupWilayah2Page> createState() => _SignupWilayah2PageState();
}

class _SignupWilayah2PageState extends State<SignupWilayah2Page> {
  final TextEditingController kodeposController =
      TextEditingController(text: '');
  final TextEditingController alamatLengkapController =
      TextEditingController(text: '');



  dynamic wardValue;
  dynamic wardGetId;
  dynamic selectedWard;

  late Future<Kelurahan> kelurahanList;
  

  @override
  void initState() {
    // TODO: implement initState
    print(widget.data.subdistrict!);
    kelurahanList = RegionService().getWard(widget.data.KecamatanId);
  }

  bool validate() {
    if (kodeposController.text.isEmpty ||
        alamatLengkapController.text.isEmpty ||
        selectedWard == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 37),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(children: [Image.asset('assets/image/logo-png.png')]),
            const SizedBox(
              height: 53,
            ),
            Row(
              children: [
                Text(
                  "Masukkan Data \nWilayah Anda",
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 19),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(8)),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "Kelurahan",
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                Container(
                      child: FutureBuilder(
                        future: kelurahanList,
                        builder: ((context, AsyncSnapshot<Kelurahan> snapshot) {
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
                                hint: selectedWard == null
                                    ? Text("Pilih Kelurahan")
                                    : Text(selectedWard.toString()),
                                value: selectedWard,
                                isExpanded: true,
                                onChanged: (value) {
                                  setState(() {
                                    selectedWard = value;
                                    
                                    wardGetId = selectedWard.id;

                                    

                                    wardValue = selectedWard;
                                  });
                                },
                                decoration: InputDecoration(
                                    focusColor: greenColor,
                                    contentPadding: const EdgeInsets.all(12),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                items: snapshot.data!.kelurahanvalue.map((val) {
                                  return DropdownMenuItem(
                                    value: val,
                                    child: Text(
                                      val.name,
                                    ),
                                  );
                                }).toList(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Material(
                                child: Text(snapshot.error.toString()),
                              ));
                            } else {
                              return const Material(
                                child: Text(""),
                              );
                            }
                          }
                        }),
                      ),
                    ),
                const SizedBox(
                  height: 17,
                ),
                CustomFormField(
                  title: "Kode Pos",
                  keyBoardType: TextInputType.number,
                  controller: kodeposController,
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomFormField(
                  title: "Alamat Lengkap",
                  controller: alamatLengkapController,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomFilledButton(
                  title: "Selanjutnya",
                  onPressed: () {
                    if (validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupSetProfilPage(
                                  data: widget.data.copyWith(
                                      ward: selectedWard.name.toString(),
                                      postal_code: kodeposController.text,
                                      address: alamatLengkapController.text))));
                      //
                    } else {
                      showCustomSnacKbar(context, "Form tidak boleh kosong");
                    }
                  },
                ),
                const SizedBox(
                  height: 17,
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
