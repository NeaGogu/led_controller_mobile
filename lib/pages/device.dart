import 'package:flutter/material.dart';
import 'package:led_controller/services/led.dart';

class Device extends StatefulWidget {
  const Device({Key? key}) : super(key: key);

  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  Map newLedInfo = {};

  @override
  Widget build(BuildContext context) {
    // get current led configuration
    Led led = ModalRoute.of(context)!.settings.arguments as Led;
    newLedInfo = led.ledInfo;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: led.ledInfo["status"] ? Colors.green : Colors.red,
        title: Text(
          led.name.toUpperCase(),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DEVICE INFO",
              style: TextStyle(
                color: Colors.grey[700],
                letterSpacing: 2,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(
                width: 4,
                color: Colors.grey,
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    led.url.toString(),
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  Text(
                    'Status: ${led.ledInfo["status"] ? "ON" : "OFF"}',
                    style: TextStyle(
                        fontSize: 18,
                        color:
                            led.ledInfo["status"] ? Colors.green : Colors.red),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "BRIGHTNESS",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
                Slider(
                  value: newLedInfo["brightness"],
                  onChanged: (newBrightness) {
                    setState(() {
                      newLedInfo["brightness"] = newBrightness;
                    });
                  },
                  min: 0,
                  max: 250,
                  divisions: 25,
                  label: '${(newLedInfo["brightness"] as double).floor()}',
                ),
                Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
