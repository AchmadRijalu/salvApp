import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:salv/models/sign_up_form_model.dart';

import 'package:http/http.dart' as http;
import 'package:salv/shared/shared_values.dart';
import '../models/sign_in_form_model.dart';
import '../models/user_model.dart';

// 10.0.2.2:8080
class AuthService {
  //Turn into dynamic parameter cause of checking the user availability
  Future<dynamic> register(SignupFormModel data) async {
    // final modifiedJson = Map.from(data!.toJson())..remove('image');
    // print(modifiedJson);
    try {
      final response = await http.post(Uri.parse("${baseUrlSalv}register"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data.toJson()));

      if (response.statusCode == 200) {
        var resHolder = jsonDecode(response.body)['message'];
        if (resHolder == "Username already exists") {
          throw "Username sudah terpakai";
        } else {
          print("200");
          final user = Userdata.fromJson(jsonDecode(response.body)['data']);

          await storeCredentialToLocal(user);
          return user;
        }
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      print("500");
      print(e);
      rethrow;
    }
  }

  Future<Userdata> login(SigninFormModel data) async {
    try {
      final response = await http.post(Uri.parse("${baseUrlSalv}login"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data.toJson()));

      if (response.statusCode == 200) {
        var resHolder = jsonDecode(response.body)['message'];

        if (resHolder == "Invalid username or password") {
          throw "Username/Password Salah";
        } else {
          final user = Userdata.fromJson(jsonDecode(response.body)['data']);
          await storeCredentialToLocal(user);

          return user;
        }
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
      await storage.write(key: 'type', value: user.type);
      print(storage.read(key: 'token'));
    } catch (e) {
      rethrow;
    }
  }

  Future<SigninFormModel?> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();

      Map<String, dynamic> values = await storage.readAll();
      if (values['username'] == null ||
          values['password'] == null ||
          values['type'] == null) {
        print("token : ${values['token']}");
        throw 'Belum Ter-Auth';
      } else {
        final SigninFormModel? data = SigninFormModel(
          username: values['username'],
          password: values['password'],
          type: values['type'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  //get Token Function
  Future<String> getToken() async {
    String? token = '';
    const storage = FlutterSecureStorage();

    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = "Bearer " + value;
    }
    return token;
  }

  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
