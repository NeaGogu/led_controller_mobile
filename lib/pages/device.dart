import 'package:flutter/material.dart';
import 'package:led_controller/services/led.dart';

class Device extends StatefulWidget {
  const Device({Key? key}) : super(key: key);

  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    Led led = ModalRoute.of(context)!.settings.arguments as Led;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(led.name.toUpperCase()),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(led.status ? "ON" : "OFF"),
        ],
      ),
    );
  }
}
