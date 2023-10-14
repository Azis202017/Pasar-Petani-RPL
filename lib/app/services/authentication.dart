import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pasar_petani/config/constants.dart';

class Authentication extends http.BaseClient {
  http.Client client = http.Client();
  final String _baseUrl = '$BACKEND_URL/api';

  Authentication();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Content-Type'] = 'application/json';
    request.headers['Accept'] = 'application/json';
    return client.send(request);
  }

  Future<Koperasi> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final Koperasi koperasi = Koperasi.fromJson(jsonDecode(response.body));
      await storage.write('access_token', koperasi.accessToken!);
      return koperasi;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  Future<Koperasi> register(String name, String email, String address,
      String password, String phoneNumber) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      body: {
        'nama': name,
        'email': email,
        'alamat': address,
        'password': password,
        'no_hp': phoneNumber,
        'role': 'koperasi'
      },
    );

    if (response.statusCode == 200) {
      return Koperasi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}

class Koperasi {
  final int id;
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String photo;
  final String createdAt;
  final String updatedAt;
  final String tokenType;
  final String? accessToken;

  Koperasi({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.tokenType,
    this.accessToken,
  });

  factory Koperasi.fromJson(Map<String, dynamic> json) {
    return Koperasi(
      id: json['user']['id'],
      name: json['user']['nama'],
      email: json['user']['email'],
      address: json['user']['alamat'],
      phoneNumber: json['user']['no_hp'],
      photo: json['user']['foto'],
      createdAt: json['user']['created_at'],
      updatedAt: json['user']['updated_at'],
      tokenType: json['token_type'],
      accessToken: json['access_token'],
    );
  }
}
