import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper {
  final Uri url;

  NetworkingHelper(this.url);

  Future getData() async {
    var locationData = await http.get(url);

    if (locationData.statusCode == 200) {
      String data = locationData.body;
      return jsonDecode(data);
    } else {
      print(locationData.statusCode);
    }
  }
}
