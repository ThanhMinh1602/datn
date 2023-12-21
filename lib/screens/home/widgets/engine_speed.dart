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
  double? _data;
  Timer? _timer;
  void getEngineSpeed() async {
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
      getEngineSpeed();
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
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 10,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 60,
              color: Colors.green,
            ),
            GaugeRange(
              startValue: 60,
              endValue: 120,
              color: Colors.orange,
            ),
            GaugeRange(
              startValue: 120,
              endValue: 180,
              color: Colors.red,
            ),
          ],
          pointers:const [
            NeedlePointer(value: 90, enableAnimation: true),
          ],
          annotations: const <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Text('90', style: TextStyle(fontSize: 25)),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        ),
      ],
    );
  }
}