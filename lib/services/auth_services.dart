import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:salv/models/sign_up_form_model.dart';

import 'package:http/http.dart' as http;
import '../models/sign_in_form_model.dart';
import '../models/user_model.dart';

// 10.0.2.2:8080
class AuthService {
  Future<User> register(SignupFormModel data) async {
    try {
      final response = await http.post(
          Uri.parse("https://salv.cloud/register"),
          body: data!.toJson());
      
      if (response.statusCode == 200) {
        final user = User.fromJson(jsonDecode(response.body));
        user.data.password = data.password!;

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  //Saving credential Account into local
  Future<void> storeCredentialToLocal(User user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.data.token);
      await storage.write(key: 'username', value: user.data.username);
      await storage.write(key: 'password', value: user.data.password);
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
