import 'package:flutter/material.dart';
import 'package:led_controller/components/device_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool dummy = true;

  List<DeviceCard> devices = [
    DeviceCard(
        deviceName: "led_1",
        location: "bedroom",
        url: "http://10.0.2.2:5001/led1"),
    DeviceCard(
        deviceName: "led_2",
        location: "bedroom",
        url: "http://10.0.2.2:5001/led1"),
    DeviceCard(
        deviceName: "led_3",
        location: "bedroom",
        url: "http://10.0.2.2:5001/led1"),
  ];

  Future<bool> _refresh() async {
    Navigator.popAndPushNamed(context, '/home');
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LED CONTROLLER"),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return devices[index];
          },
        ),
      )),
    );
  }
}
