import 'dart:convert';

import 'package:salv/models/transaksi_model.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../shared/shared_values.dart';
import 'auth_services.dart';

class TransaksiService {
  Future<Transaksi> getSellerTransaksi(User user) async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrlSalv}seller-transaction/index/${user}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await AuthService().getToken(),
        },
      );
      print(response.body);
      return Transaksi.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
