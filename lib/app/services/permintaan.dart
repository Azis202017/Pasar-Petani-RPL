import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pasar_petani/app/models/barang.dart';
import 'package:pasar_petani/config/constants.dart';

class Permintaan extends http.BaseClient {
  http.Client client = http.Client();
  final String _baseUrl = '$BACKEND_URL/api';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${storage.read('access_token')}'
  };

  Permintaan();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return client.send(request);
  }

  Future<List<Barang>> getAll() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/permintaan'),
      headers: headers,
    );

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['data'].isEmpty) {
        return [];
      }
      return List<Barang>.from(
          jsonDecode(response.body)['data'].map((x) => Barang.fromJson(x)));
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
