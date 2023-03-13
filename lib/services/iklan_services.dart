import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:salv/models/penjual_iklan_model.dart';

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
}
