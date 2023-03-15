import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/transaksi_seller_model.dart';
import '../models/user_model.dart';
import '../shared/shared_values.dart';
import 'auth_services.dart';

class TransaksiService {
  Future<TransaksiSeller> getTransaksiSeller(dynamic user) async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrlSalv}seller-transaction/index/${user}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await AuthService().getToken(),
        },
      );
      print(response.body);
      return TransaksiSeller.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  Future<TransaksiSeller> getTransaksiBuyer(dynamic user) async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrlSalv}buyer-transaction/index/${user}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await AuthService().getToken(),
        },
      );
      print(response.body);
      return TransaksiSeller.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
