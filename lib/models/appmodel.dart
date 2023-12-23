import 'package:datn/screens/home/widgets/engine_speed.dart';
import 'package:datn/screens/home/widgets/fuel_level.dart';
import 'package:datn/screens/home/widgets/distance.dart';
import 'package:datn/screens/home/widgets/vehicle_speed.dart';
import 'package:datn/screens/home/widgets/engine_temperature.dart';

import 'package:flutter/widgets.dart';

class AppModel {
  String? title;
  Widget? items;
  AppModel();
}

List<AppModel> listAppModel = [
  AppModel()
    ..title = 'vehicle speed'
    ..items = const VehicleSpeed(),
  AppModel()
    ..title = 'fuel level'
    ..items = const GaugeFuel(),
  AppModel()
    ..title = 'engine temperature'
    ..items = const GaugeTemp(),
  AppModel()
    ..title = 'engine speed'
    ..items = const EngineSpeed(),
  AppModel()
    ..title = 'distance'
    ..items = const OdoWidget(),
];
