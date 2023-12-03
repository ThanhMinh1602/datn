import 'dart:async';
import 'package:datn/services/api_endpoint.dart';
import 'package:datn/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeTemp extends StatefulWidget {
  const GaugeTemp({super.key});

  @override
  State<GaugeTemp> createState() => _GaugeTempState();
}

class _GaugeTempState extends State<GaugeTemp> {
  double valengtmp = -44;
  Timer? _timer;

  void getTemp() async {
    const endPoint = ApiEndPoint.tempEngEndPoint;
    valengtmp = await FirebaseService().fetchData(endPoint: endPoint);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      getTemp();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      minimum: -40,
      maximum: 210,
      orientation: LinearGaugeOrientation.vertical,
      majorTickStyle: const LinearTickStyle(
          length: 10, thickness: 2.5, color: Color.fromARGB(255, 15, 15, 15)),
      minorTickStyle: const LinearTickStyle(
          length: 5,
          thickness: 1.75,
          color: Color.fromARGB(255, 219, 219, 219)),
      minorTicksPerInterval: 9,
      axisLabelStyle: const TextStyle(
        color: Color.fromARGB(255, 248, 247, 247),
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      labelOffset: 20,
      markerPointers: [
        LinearWidgetPointer(
          value: valengtmp,
          position: LinearElementPosition.outside,
          offset: 20,
          child: Text("$valengtmp°C",
              style: const TextStyle(
                  color: Color.fromARGB(255, 246, 246, 250),
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
        ),
        LinearShapePointer(
          value: valengtmp,
          color: const Color.fromARGB(255, 8, 8, 8),
          shapeType: LinearShapePointerType.triangle,
          position: LinearElementPosition.inside,
          offset: 8,
        ),
      ],
      ranges: const <LinearGaugeRange>[
        //First range
        LinearGaugeRange(
            startValue: 10, endValue: 60, color: Color.fromARGB(255, 5, 5, 5)),
        //Second range
        LinearGaugeRange(
            startValue: -40,
            endValue: 10,
            color: Color.fromARGB(255, 17, 17, 17)),
        LinearGaugeRange(
            startValue: 0,
            endValue: 110,
            color: Color.fromARGB(255, 14, 13, 13)),
        LinearGaugeRange(
            startValue: 140,
            endValue: 210,
            color: Color.fromARGB(255, 247, 210, 210)),
        LinearGaugeRange(
            startValue: 110,
            endValue: 140,
            color: Color.fromARGB(255, 17, 17, 17)),
      ],
    );
  }
}
