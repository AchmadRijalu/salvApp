import 'dart:convert';

import 'package:salv/models/provinces_model.dart';
import 'package:http/http.dart' as http;
import 'package:salv/shared/shared_values.dart';

class RegionService {
  Future<Provinces> getProvinces() async {
    try {
      final response =
          await http.get(Uri.parse("${baseUrlRegion}/provinces.json"));

      if (response.statusCode == 200) {
        return Provinces.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load the data");
      }
    } catch (e) {
      rethrow;
    }
  }
}
