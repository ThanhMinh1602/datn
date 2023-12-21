import 'dart:async';
import 'package:datn/services/api_endpoint.dart';
import 'package:datn/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class EngineSpeed extends StatefulWidget {
  const EngineSpeed({super.key});

  @override
  State<EngineSpeed> createState() => _EngineSpeedState();
}

class _EngineSpeedState extends State<EngineSpeed> {
  double _data = 0;
  Timer? _timer;
  void getVehicleSpeed() async {
    const endPoint = ApiEndPoint.engineSpeedEndPoint;
    _data = await FirebaseService().fetchData(endPoint: endPoint);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      getVehicleSpeed();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
            startAngle: 270,
            endAngle: 270,
            minimum: 0,
            maximum: 80,
            interval: 10,
            radiusFactor: 0.4,
            showAxisLine: false,
            showLastLabel: false,
            onLabelCreated: labelCreated),
        RadialAxis(
          minimum: 0,
          maximum: 10,
          labelOffset: 12,
          axisLineStyle: const AxisLineStyle(
              thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
          majorTickStyle: const MajorTickStyle(
              length: 6, thickness: 4, color: Color.fromARGB(255, 15, 15, 15)),
          minorTickStyle: const MinorTickStyle(
              length: 3, thickness: 3, color: Color.fromARGB(255, 10, 10, 10)),
          axisLabelStyle: const GaugeTextStyle(
              color: Color.fromARGB(255, 14, 13, 13),
              fontWeight: FontWeight.bold,
              fontSize: 10),
          interval: 1,
          ranges: [
            GaugeRange(
              startValue: 0,
              endValue: 200,
              sizeUnit: GaugeSizeUnit.factor,
              startWidth: 0.03,
              endWidth: 0.03,
              gradient: const SweepGradient(
                colors: [
                  Color.fromARGB(255, 12, 12, 12),
                  Color.fromARGB(255, 8, 8, 8),
                  Colors.red
                ],
                stops: [0.0, 0.5, 1],
              ),
            )
          ],
          pointers: [
            NeedlePointer(
                value: _data! / 1000,
                needleLength: 0.95,
                enableAnimation: true,
                animationType: AnimationType.ease,
                needleStartWidth: 1.5,
                needleEndWidth: 6,
                needleColor: const Color.fromARGB(255, 10, 10, 10),
                knobStyle: const KnobStyle(
                    knobRadius: 0.09,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: Color.fromARGB(255, 15, 15, 15)))
          ],
          annotations: const [
            GaugeAnnotation(
                widget: Column(children: [
                  SizedBox(height: 16.0),
                  Text('x1000rmp',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 23, 5, 121)))
                ]),
                angle: 90,
                positionFactor: 1.7),
          ],
        )
      ],
    );
  }

  void labelCreated(AxisLabelCreatedArgs args) {
    if (args.text == '0') {
      args.text = 'N';
      args.labelStyle = const GaugeTextStyle(
          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 10);
    } else if (args.text == '10') {
      args.text = '';
    } else if (args.text == '20') {
      args.text = 'E';
    } else if (args.text == '30') {
      args.text = '';
    } else if (args.text == '40') {
      args.text = 'S';
    } else if (args.text == '50') {
      args.text = '';
    } else if (args.text == '60') {
      args.text = 'W';
    } else if (args.text == '70') {
      args.text = '';
    }
  }
}
