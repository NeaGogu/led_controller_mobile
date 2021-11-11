import 'package:http/http.dart';
import 'dart:convert';

class Led {
  late Uri url;
  String name;
  bool isOffline = false;

  Map ledInfo = {
    "status": bool,
    "brightness": double,
    "mode": String,
  };

  Led({required String url, required this.name}) {
    this.url = Uri.parse("http://10.0.2.2:5001/led1");
  }

  Future<String> getInfo() async {
    try {
      Response response = await get(url).timeout(Duration(seconds: 1));
      // TODO: add error handling code
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        isOffline = false;
        ledInfo["status"] = data['status'];
        ledInfo["brightness"] = data['brightness'];
        ledInfo["mode"] = data['mode'];
        print(ledInfo["brightness"].runtimeType);
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
