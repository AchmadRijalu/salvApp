import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:salv/models/sign_up_form_model.dart';

import 'package:http/http.dart' as http;
import 'package:salv/shared/shared_values.dart';
import '../models/sign_in_form_model.dart';
import '../models/user_model.dart';

// 10.0.2.2:8080
class AuthService {
  Future<Userdata> register(SignupFormModel data) async {
    // final modifiedJson = Map.from(data!.toJson())..remove('image');
    // print(modifiedJson);
    // print("data : ${data.address}");
    // print("data : ${data.postal_code}");
    // print("data : ${data.image}");
    // print("data : ${data.name}");
    // print("data : ${data.username}");
    // print("data : ${data.password}");
    // print("data : ${data.type}");
    // print("data : ${data.phone}");
    // print("data : ${data.province}");
    // print("data : ${data.city}");
    // print("data : ${data.subdistrict}");
    // print("data : ${data.ward}");
    try {
      final response = await http.post(Uri.parse("${baseUrlSalv}register"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data.toJson()));
      print(response.body);

      if (response.statusCode == 200) {
        // if (response.body['status_code'] == 401) {}
        print("200");
        final user = Userdata.fromJson(jsonDecode(response.body));
        // user.data.password = data.password!;
        // user.password = data.password!;
        // await storeCredentialToLocal(user);
        print(user);
        return user;
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      print("500");
      print(e);
      rethrow;
    }
  }

  //Saving credential Account into local
  Future<void> storeCredentialToLocal(Userdata user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'username', value: user.username);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<SigninFormModel?> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();

      Map<String, dynamic> values = await storage.readAll();
      if (values['username'] == null || values['password'] == null) {
        throw 'Authenticated';
      } else {
        final SigninFormModel? data = SigninFormModel(
          username: values['username'],
          password: values['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }
}
