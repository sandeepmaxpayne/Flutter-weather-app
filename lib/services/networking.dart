import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkData {
  final String url;
  NetworkData({this.url});

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print('fetch success');
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
