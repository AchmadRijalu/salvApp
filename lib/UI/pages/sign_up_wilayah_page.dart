import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/sign_up_wilayah_2_page.dart';
import 'package:salv/models/provinces_model.dart';
import 'package:salv/models/sign_up_form_model.dart';
import 'package:salv/models/subdistricts_model.dart';
import 'package:salv/services/region_service.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:location/location.dart';
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
  dynamic provinceValuess;
  dynamic provinceGetId;
  dynamic selectedProvince;

  dynamic cityValue;
  dynamic cityGetId;
  dynamic selectedCity;

  dynamic subdistrictValue;
  dynamic subdistrictGetId;
  dynamic selectedSubdistrict;

  late Future<Provinsi> provinceList;
  late Future<Kota> cityList;
  late Future<Kecamatan> kecamatanList;

  Location location = new Location();
  bool? serviceEnabled;
  LocationData? currentPosition;

  String? address;
  String? dateTime;

  //getLocation
  Future<dynamic> getLocation() async {
    var permissionStatus = await Permission.location.status;
    serviceEnabled = await location.serviceEnabled();
    if (serviceEnabled!) serviceEnabled = await location.requestService();
    print("hasil : $permissionStatus");
    if (permissionStatus.isDenied ||
        permissionStatus.isPermanentlyDenied ||
        permissionStatus.isRestricted) {
      print("denied");

      await openAppSettings();
    } else {
      currentPosition = await location.getLocation();
    }

    return currentPosition;
  }

  Future<Kota> getCities(dynamic provId) async {
    dynamic listCity;
    await RegionService().getCity(int.parse(provId)).then((value) {
      setState(() {
        listCity = value;
      });
    });
    return listCity;
  }

  Future<Kecamatan> getSubDistricts(dynamic cityId) async {
    dynamic listSubdistricts;
    await RegionService().getSubDistrict(int.parse(cityId)).then((value) {
      setState(() {
        listSubdistricts = value;
      });
    });
    return listSubdistricts;
  }

  bool validate() {
    if (selectedProvince == null ||
        selectedCity == null ||
        selectedSubdistrict == null) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    provinceList = RegionService().getProvinces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 37),
        child: ListView(children: [
          Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 23, horizontal: 19),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8)),
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
                          Container(
                            child: FutureBuilder(
                              future: provinceList,
                              builder:
                                  ((context, AsyncSnapshot<Provinsi> snapshot) {
                                var state = snapshot.connectionState;
                                if (state != ConnectionState.done) {
                                  return DropdownButtonFormField(
                                    hint: Text("Tunggu Sebentar.."),
                                    decoration: InputDecoration(
                                        focusColor: greenColor,
                                        contentPadding:
                                            const EdgeInsets.all(12),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    items: [],
                                    onChanged: (value) {},
                                  );
                                } else {
                                  if (snapshot.hasData) {
                                    return DropdownButtonFormField(
                                      hint: selectedProvince == null
                                          ? Text("Pilih Provinsi")
                                          : Text(selectedProvince.toString()),
                                      value: selectedProvince,
                                      isExpanded: true,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedProvince = value;
                                          selectedProvince.toString();
                                          provinceGetId = selectedProvince.id;
                                          selectedCity = null;
                                          cityValue = getCities(provinceGetId);
                                        });
                                      },
                                      decoration: InputDecoration(
                                          focusColor: greenColor,
                                          contentPadding:
                                              const EdgeInsets.all(12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))),
                                      items: snapshot.data!.provinsiValue
                                          .map((val) {
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
                                          contentPadding:
                                              const EdgeInsets.all(12),
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
                          Container(
                              child: selectedProvince != null
                                  ? FutureBuilder<Kota>(
                                      future: cityValue,
                                      builder: ((context, snapshot) {
                                        if (snapshot.connectionState !=
                                            ConnectionState.done) {
                                          return DropdownButtonFormField(
                                            hint: Text("Tunggu Sebentar.."),
                                            decoration: InputDecoration(
                                                focusColor: greenColor,
                                                contentPadding:
                                                    const EdgeInsets.all(12),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8))),
                                            items: [],
                                            onChanged: (value) {},
                                          );
                                        } else if (snapshot.hasData) {
                                          return DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                  focusColor: greenColor,
                                                  contentPadding:
                                                      const EdgeInsets.all(12),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8))),
                                              hint: selectedCity == null
                                                  ? Text("Pilih Kota")
                                                  : Text(
                                                      "${selectedCity.name}"),
                                              isExpanded: true,
                                              icon: Icon(Icons.arrow_drop_down),
                                              value: selectedCity,
                                              iconSize: 30,
                                              elevation: 16,
                                              items: snapshot.data!.value.map<
                                                      DropdownMenuItem<
                                                          KotaValue>>(
                                                  (KotaValue value) {
                                                return DropdownMenuItem(
                                                    value: value,
                                                    child: Text(value.name!
                                                        .toString()));
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  // cityData = getCities(provId);
                                                  selectedCity = value;
                                                  selectedCity.toString();
                                                  cityGetId = selectedCity.id;
                                                  subdistrictValue =
                                                      getSubDistricts(
                                                          cityGetId);
                                                  selectedSubdistrict = null;
                                                });
                                              });
                                        } else if (snapshot.hasError) {
                                          return DropdownButtonFormField(
                                            hint: Text("No Internet"),
                                            decoration: InputDecoration(
                                                focusColor: greenColor,
                                                contentPadding:
                                                    const EdgeInsets.all(12),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8))),
                                            items: [],
                                            onChanged: (value) {},
                                          );
                                        }

                                        return CircularProgressIndicator();
                                      }))
                                  : DropdownButtonFormField(
                                      hint: Text("Pilih Kota"),
                                      decoration: InputDecoration(
                                          focusColor: greenColor,
                                          contentPadding:
                                              const EdgeInsets.all(12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))),
                                      items: [],
                                      onChanged: (value) {},
                                    )),
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
                          Container(
                              child: selectedCity != null
                                  ? FutureBuilder<Kecamatan>(
                                      future: subdistrictValue,
                                      builder: ((context, snapshot) {
                                        if (snapshot.connectionState !=
                                            ConnectionState.done) {
                                          return DropdownButtonFormField(
                                            hint: Text("Tunggu Sebentar.."),
                                            decoration: InputDecoration(
                                                focusColor: greenColor,
                                                contentPadding:
                                                    const EdgeInsets.all(12),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8))),
                                            items: [],
                                            onChanged: (value) {},
                                          );
                                        } else if (snapshot.hasData) {
                                          return DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                  focusColor: greenColor,
                                                  contentPadding:
                                                      const EdgeInsets.all(12),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8))),
                                              hint: selectedSubdistrict == null
                                                  ? Text("Pilih Kecamatan")
                                                  : Text(
                                                      "${selectedSubdistrict}"),
                                              isExpanded: true,
                                              icon: Icon(Icons.arrow_drop_down),
                                              value: selectedSubdistrict,
                                              iconSize: 30,
                                              elevation: 16,
                                              items: snapshot.data!.value.map<
                                                      DropdownMenuItem<
                                                          KecamatanValue>>(
                                                  (KecamatanValue value) {
                                                return DropdownMenuItem(
                                                    value: value,
                                                    child: Text(
                                                        value.name.toString()));
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedSubdistrict = value;
                                                  selectedSubdistrict
                                                      .toString();
                                                });
                                              });
                                        } else if (snapshot.hasError) {
                                          return DropdownButtonFormField(
                                            hint: Text("No Internet"),
                                            decoration: InputDecoration(
                                                focusColor: greenColor,
                                                contentPadding:
                                                    const EdgeInsets.all(12),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8))),
                                            items: [],
                                            onChanged: (value) {},
                                          );
                                        }

                                        return CircularProgressIndicator();
                                      }))
                                  : DropdownButtonFormField(
                                      hint: Text("Pilih Kecamatan"),
                                      decoration: InputDecoration(
                                          focusColor: greenColor,
                                          contentPadding:
                                              const EdgeInsets.all(12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))),
                                      items: [],
                                      onChanged: (value) {},
                                    )),
                          const SizedBox(
                            height: 17,
                          ),
                          if (widget.data!.type == "buyer") ...[
                            Text(
                              "Get Location",
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll<Color>(
                                              Colors.white70),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ))),
                                  onPressed: () async {
                                    await getLocation().then((value) {
                                      print(value);
                                    });
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Get Location",
                                        style: greyTextStyle.copyWith(
                                            fontWeight: medium, fontSize: 14),
                                      ),
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.black45,
                                      )
                                    ],
                                  )),
                            ),
                          ],
                          const SizedBox(
                            height: 36,
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
                                              province: selectedProvince.name
                                                  .toString(),
                                              city:
                                                  selectedCity.name.toString(),
                                              KecamatanId: selectedSubdistrict
                                                  .id
                                                  .toString(),
                                              subdistrict: selectedSubdistrict
                                                  .name
                                                  .toString())),
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
        ]),
      ),
    );
  }
}
