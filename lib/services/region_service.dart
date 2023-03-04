import 'dart:convert';

import 'package:salv/models/provinces_model.dart';
import 'package:http/http.dart' as http;
import 'package:salv/models/wards_model.dart';
import 'package:salv/shared/shared_values.dart';

import '../models/city_model.dart';

class RegionService {
  Future<Provinsi> getProvinces() async {
    try {
      final response = await http.get(Uri.parse("${baseUrlRegion}/provinsi"));
      print("${baseUrlRegion}/provinsi");
      if (response.statusCode == 200) {
        return Provinsi.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load the data");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<City> getCity(int? ProvId) async {
    try {
      final response = await http
          .get(Uri.parse("${baseUrlRegion}/kota?id_provinsi=${ProvId}"));
      if (response.statusCode == 200) {
        return City.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load the data");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Kecamatan> getWard(int? cityId) async {
    try {
      final response = await http
          .get(Uri.parse("${baseUrlRegion}/kecamatan?id_kota=${cityId}"));
      print("URL = ${baseUrlRegion}/kota?id_kecamatan=${cityId}");
      if (response.statusCode == 200) {
        return Kecamatan.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load the data");
      }
    } catch (e) {
      rethrow;
    }
  }
}
