import 'package:datn/screens/home/widgets/fuel.dart';
import 'package:datn/screens/home/widgets/speed.dart';
import 'package:datn/screens/home/widgets/temp.dart';
import 'package:flutter/widgets.dart';

class AppModel {
  String? title;
  Widget? items;
  AppModel();
}

List<AppModel> listAppModel = [
  AppModel()
    ..title = 'vehicle speed'
    ..items = const GaugeSpeed(),
  AppModel()
    ..title = 'fuel level'
    ..items = const GaugeFuel(),
  AppModel()
    ..title = 'engine temperature'
    ..items = const GaugeTemp(),
  AppModel()
    ..title = 'distance'
    ..items = const GaugeTemp(),
  AppModel()
    ..title = 'engine speed'
    ..items = const GaugeTemp(),
];
