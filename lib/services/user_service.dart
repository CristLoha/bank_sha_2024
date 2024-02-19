import 'dart:convert';

import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<UserModel>> getRecentusers() async {
    String baseUrl = 'https://bwabank.my.id/api';
    try {
      final token = await AuthService().getToken();

      final res =
          await http.get(Uri.parse('$baseUrl/transfer_histories'), headers: {
        'Authorization': token,
      });

      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body)['data'].map(
            (user) => UserModel.fromJson(user),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUsersByUsername(String username) async {
    String baseUrl = 'https://bwabank.my.id/api';
    try {
      final token = await AuthService().getToken();

      final res =
          await http.get(Uri.parse('$baseUrl/users/$username'), headers: {
        'Authorization': token,
      });

      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body).map(
            (user) => UserModel.fromJson(user),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
