import 'package:http/http.dart';
import 'dart:convert';

class Led {
  bool status = false;
  int brightness = 0;
  String mode = "";
  late Uri url;
  String name;
  bool isOffline = false;

  Led({required String url, required this.name}) {
    this.url = Uri.parse("http://10.0.2.2:5001/led1");
  }

  Future<String> getInfo() async {
    try {
      Response response = await get(url).timeout(Duration(seconds: 2));
      // TODO: add error handling code
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        isOffline = false;
        status = data['status'];
        brightness = data['brightness'];
        mode = data['mode'];

        return "Success";
      }
      return "Failed";
    } catch (e) {
      isOffline = true;
      print(e);
      return "Failed";
    }
  }
}
