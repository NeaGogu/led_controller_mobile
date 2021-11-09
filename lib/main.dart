import 'package:flutter/material.dart';
import 'package:led_controller/pages/loading.dart';
import 'package:led_controller/pages/device.dart';
import 'package:led_controller/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      // '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/device': (context) => Device(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
