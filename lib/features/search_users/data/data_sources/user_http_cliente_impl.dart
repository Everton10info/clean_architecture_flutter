import 'dart:convert';

import 'package:flutter_clean_architeture/core/api/app_env.dart';
import 'package:flutter_clean_architeture/core/http/http_client.dart';
import 'package:flutter_clean_architeture/features/search_users/data/dtos/user_dto.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:http/http.dart' as http;

class HttpClienteImpl implements AppHttpClient {
  late final String baseUrl;

  HttpClienteImpl._internal() {
    baseUrl = ApiUrl.url;
  }

  static final _singleton = HttpClienteImpl._internal();

  factory HttpClienteImpl() => _singleton;
  @override
  Future<List<UserEntity>> get() async {
    String uri = baseUrl;
    String path = '/users';

    http.Response response = await http.get(Uri.parse(uri + path));

    if (response.statusCode == 200) {
      List<UserEntity> listUser;

      final List res = jsonDecode(response.body);
      listUser = res.map((e) => User.fromJson(e)).toList();
      return listUser;
    } else {
      throw (response.statusCode);
    }
  }
}
