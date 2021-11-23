import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

String baseURL = 'https://api.github.com/users';

class Api {
  getGithub(user) async {
    String url = '$baseURL/$user';

    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    return retorno;
  }
}