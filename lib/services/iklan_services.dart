import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:salv/models/iklan_add_model.dart';
import 'package:salv/models/iklan_form_model.dart';
import 'package:salv/models/pembeli_iklan_model.dart';
import 'package:salv/models/penjual_iklan_model.dart';
import 'package:salv/models/user_model.dart';

import '../shared/shared_values.dart';
import 'auth_services.dart';

class IklanService {
  Future<IklanSeller> getIklan() async {
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
  
  Future<IklanBuyer> getIklanBuyer(dynamic user) async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrlSalv}buyer-advertisement/index/${user}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await AuthService().getToken(),
        },
      );
      print(response.body);
      return IklanBuyer.fromJson(json.decode(response.body));
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
        print("200");
        print(response.body);
        final iklanAdded = IklanAddModel.fromJson(jsonDecode(response.body));

        print(iklanAdded.message);
        return iklanAdded;
      } else {
        throw jsonDecode(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
