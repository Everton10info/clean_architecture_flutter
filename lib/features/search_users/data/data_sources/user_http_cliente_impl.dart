import 'package:flutter_clean_architeture/core/api/app_env.dart';
import 'package:flutter_clean_architeture/core/http/http_client.dart';
import 'package:http/http.dart' as http;

class HttpClienteImpl implements AppClient {
  late final String baseUrl;

  HttpClienteImpl._internal() {
    baseUrl = ApiUrl.url;
  }

  static final _singleton = HttpClienteImpl._internal();

  factory HttpClienteImpl() => _singleton;
  @override
  Future<dynamic> get() async {
    String uri = baseUrl;
    String path = '/users';

    http.Response response = await http.get(Uri.parse(uri + path));

    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      return response.statusCode;
    }
  }
}
