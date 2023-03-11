import 'dart:convert';

import 'package:salv/models/provinces_model.dart';
import 'package:http/http.dart' as http;
import 'package:salv/models/ward_model.dart';

import 'package:salv/shared/shared_values.dart';

import '../models/city_model.dart';
import '../models/subdistricts_model.dart';

class RegionService {
  Future<Provinsi> getProvinces() async {
    try {
      final response = await http.get(Uri.parse("${baseUrlRegion}/provinsi?api_key=${apikeyRegion}"));
      
      if (response.statusCode == 200) {

      
        return Provinsi.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load the data");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Kota> getCity(dynamic ProvId) async {
    try {
      final response = await http
          .get(Uri.parse("${baseUrlRegion}/kabupaten?api_key=${apikeyRegion}&id_provinsi=${ProvId}"));
          
      if (response.statusCode == 200) {
        return Kota.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load the data");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Kecamatan> getSubDistrict(dynamic? cityId) async {
    try {
      final response = await http
          .get(Uri.parse("${baseUrlRegion}/kecamatan?api_key=${apikeyRegion}&id_kabupaten=${cityId}"));
      print(response);
      if (response.statusCode == 200) {
        return Kecamatan.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load the data");
      }
    } catch (e) {
      rethrow;
    }
  }
  Future<Kelurahan> getWard(dynamic? subDistrictId) async {
    try {
      final response = await http
          .get(Uri.parse("${baseUrlRegion}/kelurahan?api_key=${apikeyRegion}&id_kecamatan=${subDistrictId}"));
      
      if (response.statusCode == 200) {
        return Kelurahan.fromJson(jsonDecode(response.body));
      } else {
        print(response);
        throw Exception("Failed to load the data");
      }
    } catch (e) {
      rethrow;
    }
  }
}
