import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

String baseURL = 'https://viacep.com.br/ws/';

class Api {
  getCep(text) async {
    String url = '$baseURL/${text}/json/';

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    return retorno;
  }
}