import 'dart:convert';

import 'package:salv/models/kategori_limbah_model.dart';
import 'package:http/http.dart' as http;

import '../shared/shared_values.dart';
import 'auth_services.dart';
class KategoriLimbahService{
  Future<KategoriLimbah> getKategoriLimbah() async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrlSalv}buyer-advertisement/create"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await AuthService().getToken(),
        },
      );
      print(response.body);
      return KategoriLimbah.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}