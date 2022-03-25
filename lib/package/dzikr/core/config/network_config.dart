import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkConfig {
  NetworkConfig({required this.baseUrl});
  final String baseUrl;

  doGet({Map<String, String>? headers}) async {
    var response = await http.get(Uri.parse(baseUrl), headers: headers);
    return jsonDecode(response.body);
  }
}
