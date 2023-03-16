import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:salv/models/beranda_buyer_model.dart';
import 'package:salv/models/beranda_seller_model.dart';

import '../shared/shared_values.dart';
import 'auth_services.dart';

class BerandaService {
  Future<BerandaSeller> getAllBerandaSeller(dynamic user) async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrlSalv}seller-home/index/${user}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await AuthService().getToken(),
        },
      );

      return BerandaSeller.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  Future<BerandaBuyer> getAllBerandaBuyer(dynamic user) async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrlSalv}buyer-home/index/${user}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await AuthService().getToken(),
        },
      );
      return BerandaBuyer.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
