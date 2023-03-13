import 'dart:convert';

import 'package:salv/services/auth_services.dart';

import '../models/edukasi_model.dart';
import 'package:http/http.dart' as http;

import '../shared/shared_values.dart';

class EdukasiService {
  Future<Edukasi> getEdukasi() async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrlSalv}education/index"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await AuthService().getToken(),
        },

        
      );
      print(response.body);
      return Edukasi.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
