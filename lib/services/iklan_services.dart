import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:salv/blocs/iklan/iklan_bloc.dart';
import 'package:salv/models/iklan_add_model.dart';
import 'package:salv/models/iklan_form_model.dart';
import 'package:salv/models/iklan_buyer_detail_model.dart';
import 'package:salv/models/pembeli_iklan_model.dart';
import 'package:salv/models/penjual_iklan_model.dart';
import 'package:salv/models/user_model.dart';

import '../shared/shared_values.dart';
import 'auth_services.dart';

class IklanService {
  Future<IklanSeller> getIklanSeller() async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrlSalv}seller-advertisement/index"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await AuthService().getToken(),
        },
      );
      print(response.body);
      return IklanSeller.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  //BUYER SERVICE SIDE

  Future<IklanBuyer> getIklanBuyer(dynamic user) async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrlSalv}buyer-advertisement/index/${user}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await AuthService().getToken(),
        },
      );

      return IklanBuyer.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  Future<IklanBuyerDetail> getIklanBuyerDetail(dynamic id) async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrlSalv}buyer-advertisement/${id}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await AuthService().getToken(),
        },
      );
      print("PRINT : ${response.body}");

      return IklanBuyerDetail.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  //not done yet
  Future<dynamic> addIklanBuyer(TambahIklanForm tambahIklanForm) async {
    try {
      final response =
          await http.post(Uri.parse("${baseUrlSalv}buyer-advertisement"),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': await AuthService().getToken(),
              },
              body: jsonEncode(tambahIklanForm.toJson()));

      if (response.statusCode == 200) {
        final iklanAdded = IklanAddModel.fromJson(jsonDecode(response.body));

        return iklanAdded;
      } else {
        throw jsonDecode(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
