import 'package:http/http.dart' as http;
import 'dart:convert';

class HelpNetwork {
  HelpNetwork(this.url);

  final String url;

  Future info() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String infoBody = response.body;
      return jsonDecode(infoBody);
    } else {
      print(response.statusCode);
    }
  }
}
