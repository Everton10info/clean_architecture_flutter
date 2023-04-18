import 'package:flutter_clean_architeture/core/api/app_env.dart';
import 'package:http/http.dart' as http;
import 'http_client.dart';

class AppHttpClienteImp implements AppClient {
  late final String baseUrl;

  AppHttpClienteImp._internal() {
    baseUrl = AppEnvironment.baseUrl;
  }

  static final _singleton = AppHttpClienteImp._internal();

  factory AppHttpClienteImp() => _singleton;

  @override
  Future get(String api) async {
    var url = Uri.http(api);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode;
    }
  }
}
