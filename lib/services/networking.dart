import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  String url;
  Networking({this.url});

  Future getData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
