import 'dart:convert';

import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:http/http.dart' as http;

class PaymentmethodService {
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    String baseUrl = 'https://bwabank.my.id/api';
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse(
          '$baseUrl/payment_methods',
        ),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        return List<PaymentMethodModel>.from(jsonDecode(res.body).map(
                (paymentMehod) => PaymentMethodModel.fromJson(paymentMehod)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
