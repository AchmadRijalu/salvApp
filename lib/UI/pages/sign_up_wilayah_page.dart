import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/sign_up_wilayah_2_page.dart';
import 'package:salv/models/provinces_model.dart';
import 'package:salv/models/sign_up_form_model.dart';
import 'package:salv/models/wards_model.dart';
import 'package:salv/services/region_service.dart';

import '../../common/common.dart';
import '../../models/city_model.dart';
import '../../shared/shared_methods.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class SignupWilayahPage extends StatefulWidget {
  final SignupFormModel? data;
  static const routeName = '/singupwilayah';
  const SignupWilayahPage({super.key, required this.data});

  @override
  State<SignupWilayahPage> createState() => _SignupWilayahPageState();
}

class _SignupWilayahPageState extends State<SignupWilayahPage> {
  dynamic provinceValues;
  dynamic? cityValue;
  dynamic wardValue;

  late Future<Provinsi> provinceList;
  late Future<City> cityList;
  late Future<Kecamatan> kecamatanList;

  Future<City> getCities(dynamic provId) async {
    dynamic listCity;
    await RegionService().getCity(provId).then((value) {
      setState(() {
        listCity = value;
      });
    });
    return listCity;
  }

  Future<Kecamatan> getWards(dynamic cityId) async {
    dynamic listWards;
    await RegionService().getWard(cityId).then((value) {
      setState(() {
        listWards = value;
      });
    });
    return listWards;
  }

  List<String> listOfProvinsi = [
    'Jawa Timur',
    'Jawa Tengah',
    'Jawa Barat',
    'DKI Jakarta',
    'Sumatra Selatan'
  ];

  List<String> listOfKota = [
    'Surabaya',
    'Sidoarjo',
    'Jember',
    'Jombang',
    'Tuban'
  ];

  List<String> listOfKecamatan = [
    'Rungkut',
    'Gayungan',
    'Lakarsantri',
    'Sambikerep',
    'Wiyung'
  ];

  bool validate() {
    if (provinceValues == null || cityValue == null || wardValue == null) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    print(widget.data!.name);
    super.initState();
    this.cityValue.toString();
    provinceList = RegionService().getProvinces();
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Provinsi",
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // Container(
                    //   child: FutureBuilder(
                    //     future: provinceList,
                    //     builder: ((context, AsyncSnapshot<Provinsi> snapshot) {
                    //       var state = snapshot.connectionState;
                    //       if (state != ConnectionState.done) {
                    //         return DropdownButtonFormField(
                    //           decoration: InputDecoration(
                    //               focusColor: greenColor,
                    //               contentPadding: const EdgeInsets.all(12),
                    //               border: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(8))),
                    //           items: [],
                    //           onChanged: (value) {},
                    //         );
                    //       } else {
                    //         if (snapshot.hasData) {
                    //           return DropdownButtonFormField(
                    //             value: provinceValues,
                    //             isExpanded: true,
                    //             onChanged: (dynamic value) {
                    //               setState(() {
                    //                 provinceValues = value;
                    //               });
                    //             },
                    //             decoration: InputDecoration(
                    //                 focusColor: greenColor,
                    //                 contentPadding: const EdgeInsets.all(12),
                    //                 border: OutlineInputBorder(
                    //                     borderRadius:
                    //                         BorderRadius.circular(8))),
                    //             onSaved: (dynamic value) {
                    //               setState(() {
                    //                 provinceValues = value;
                    //               });
                    //             },
                    //             items:
                    //                 snapshot.data!.provinsi.map((dynamic val) {
                    //               return DropdownMenuItem(
                    //                 value: val,
                    //                 child: Text(
                    //                   val.nama,
                    //                 ),
                    //               );
                    //             }).toList(),
                    //           );
                    //         } else if (snapshot.hasError) {
                    //           return Center(
                    //               child: Material(
                    //             child: Text(snapshot.error.toString()),
                    //           ));
                    //         } else {
                    //           return const Material(
                    //             child: Text(""),
                    //           );
                    //         }
                    //       }
                    //     }),
                    //   ),
                    // ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          focusColor: greenColor,
                          contentPadding: const EdgeInsets.all(12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                      items: listOfProvinsi.map((dynamic val) {
                        return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          provinceValues = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Kota",
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // Container(
                    //   child: provinceValues == null
                    //       ? DropdownButtonFormField(
                    //           decoration: InputDecoration(
                    //               focusColor: greenColor,
                    //               contentPadding: const EdgeInsets.all(12),
                    //               border: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(8))),
                    //           items: [],
                    //           onChanged: (value) {},
                    //         )
                    //       : FutureBuilder(
                    //           future: getCities(provinceValues.id),
                    //           builder:
                    //               ((context, AsyncSnapshot<City> snapshot) {
                    //             if (snapshot.hasData) {
                    //               return DropdownButtonFormField(
                    //                 value: cityValue,
                    //                 isExpanded: true,
                    //                 onChanged: (value) {
                    //                   setState(() {
                    //                     cityValue = value;
                    //                     print(cityValue);
                    //                   });
                    //                 },
                    //                 decoration: InputDecoration(
                    //                     focusColor: greenColor,
                    //                     contentPadding:
                    //                         const EdgeInsets.all(12),
                    //                     border: OutlineInputBorder(
                    //                         borderRadius:
                    //                             BorderRadius.circular(8))),
                    //                 onSaved: (dynamic value) {
                    //                   setState(() {
                    //                     cityValue = value;
                    //                     print(cityValue);
                    //                   });
                    //                 },
                    //                 items:
                    //                     snapshot.data!.kotaKabupaten.map((val) {
                    //                   return DropdownMenuItem(
                    //                     value: val.nama,
                    //                     child: Text(
                    //                       val.nama,
                    //                     ),
                    //                   );
                    //                 }).toList(),
                    //               );
                    //             } else if (snapshot.hasError) {
                    //               return Center(
                    //                   child: Material(
                    //                       child: DropdownButtonFormField(
                    //                 decoration: InputDecoration(
                    //                     focusColor: greenColor,
                    //                     contentPadding:
                    //                         const EdgeInsets.all(12),
                    //                     border: OutlineInputBorder(
                    //                         borderRadius:
                    //                             BorderRadius.circular(8))),
                    //                 items: [],
                    //                 onChanged: (value) {},
                    //               )));
                    //             } else {
                    //               return DropdownButtonFormField(
                    //                 decoration: InputDecoration(
                    //                     focusColor: greenColor,
                    //                     contentPadding:
                    //                         const EdgeInsets.all(12),
                    //                     border: OutlineInputBorder(
                    //                         borderRadius:
                    //                             BorderRadius.circular(8))),
                    //                 items: [],
                    //                 onChanged: (value) {},
                    //               );
                    //             }
                    //           }),
                    //         ),
                    // ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          focusColor: greenColor,
                          contentPadding: const EdgeInsets.all(12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                      items: listOfKota.map((dynamic val) {
                        return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          cityValue = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Kecamatan",
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // Container(
                    //   child: cityValue == null
                    //       ? DropdownButtonFormField(
                    //           decoration: InputDecoration(
                    //               focusColor: greenColor,
                    //               contentPadding: const EdgeInsets.all(12),
                    //               border: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(8))),
                    //           items: [],
                    //           onChanged: (value) {},
                    //         )
                    //       : FutureBuilder(
                    //           future: getWards(3216),
                    //           builder: ((context,
                    //               AsyncSnapshot<Kecamatan> snapshot) {
                    //             if (snapshot.hasData) {
                    //               return DropdownButtonFormField(
                    //                 value: wardValue,
                    //                 isExpanded: true,
                    //                 onChanged: (value) {
                    //                   setState(() {
                    //                     wardValue = value;
                    //                   });
                    //                 },
                    //                 decoration: InputDecoration(
                    //                     focusColor: greenColor,
                    //                     contentPadding:
                    //                         const EdgeInsets.all(12),
                    //                     border: OutlineInputBorder(
                    //                         borderRadius:
                    //                             BorderRadius.circular(8))),
                    //                 onSaved: (dynamic value) {
                    //                   setState(() {
                    //                     wardValue = value;
                    //                   });
                    //                 },
                    //                 items: snapshot.data!.kecamatan.map((val) {
                    //                   return DropdownMenuItem(
                    //                     value: val.nama.toString(),
                    //                     child: Text(
                    //                       val.nama.toString(),
                    //                     ),
                    //                   );
                    //                 }).toList(),
                    //               );
                    //             } else if (snapshot.hasError) {
                    //               return Center(
                    //                   child: Material(
                    //                       child: DropdownButtonFormField(
                    //                 decoration: InputDecoration(
                    //                     focusColor: greenColor,
                    //                     contentPadding:
                    //                         const EdgeInsets.all(12),
                    //                     border: OutlineInputBorder(
                    //                         borderRadius:
                    //                             BorderRadius.circular(8))),
                    //                 items: [],
                    //                 onChanged: (value) {},
                    //               )));
                    //             } else {
                    //               return DropdownButtonFormField(
                    //                 decoration: InputDecoration(
                    //                     focusColor: greenColor,
                    //                     contentPadding:
                    //                         const EdgeInsets.all(12),
                    //                     border: OutlineInputBorder(
                    //                         borderRadius:
                    //                             BorderRadius.circular(8))),
                    //                 items: [],
                    //                 onChanged: (value) {},
                    //               );
                    //             }
                    //           }),
                    //         ),
                    // ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          focusColor: greenColor,
                          contentPadding: const EdgeInsets.all(12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                      items: listOfKecamatan.map((dynamic val) {
                        return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          wardValue = value;
                        });
                      },
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
                                builder: (context) => SignupWilayah2Page(
                                    data: widget.data!.copyWith(
                                  province: provinceValues,
                                  city: cityValue,
                                  ward: wardValue,
                                )),
                              ));
                          //
                        } else {
                          showCustomSnacKbar(
                              context, "Form tidak boleh kosong");
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
