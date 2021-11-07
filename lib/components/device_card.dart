import 'package:flutter/material.dart';
import 'package:led_controller/services/led.dart';

class DeviceCard extends StatefulWidget {
  final String deviceName;
  final String location;
  late Led led;

  DeviceCard(
      {Key? key,
      required this.deviceName,
      required this.location,
      required String url})
      : super(key: key) {
    led = Led(url: url, name: deviceName);
  }

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  late Color disabledColor = Colors.white;

  Future<bool> checkInitialStatus() async {
    String status = await widget.led.getInfo();
    if (status == "Failed") {
      setState(() {
        disabledColor = Colors.red.withOpacity(0.7);
      });
      return false;
    }
    setState(() {
      disabledColor = Colors.white;
    });
    return true;
  }

  @override
  void didUpdateWidget(covariant DeviceCard oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("fvdsfdsfdsafa");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInitialStatus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // TODO: check if led is online
        var resp = await checkInitialStatus();
        if (resp == true) {
          Navigator.pushNamed(context, '/device', arguments: widget.led);
        }
        print('alo');
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        color: disabledColor,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // TITLE
              Text(
                widget.deviceName.toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
              // LOCATION
              Text(widget.location,
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]))
            ],
          ),
        ),
      ),
    );
  }
}
