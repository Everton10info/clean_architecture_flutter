import 'package:flutter_clean_architeture/core/api/app_env.dart';
import 'package:flutter_clean_architeture/core/http/http_client.dart';
import 'package:http/http.dart' as http;

class HttpClienteImp implements AppClient {
  late final String baseUrl;

  HttpClienteImp._internal() {
    baseUrl = ApiUrl.url;
  }

  static final _singleton = HttpClienteImp._internal();

  factory HttpClienteImp() => _singleton;
  @override
  Future<dynamic> get() async {
    String uri = baseUrl;
    String path = '/users';

    http.Response response = await http.get(Uri.parse(uri + path));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode;
    }
  }
}
