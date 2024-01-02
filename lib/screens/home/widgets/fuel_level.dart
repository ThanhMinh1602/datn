import 'dart:async';
import 'package:datn/gen/assets.gen.dart';
import 'package:datn/services/api_endpoint.dart';
import 'package:datn/services/firebase_service.dart';
import 'package:datn/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeFuel extends StatefulWidget {
  const GaugeFuel({
    super.key,
  });
  State<GaugeFuel> createState() => _GaugeFuelState();
}

class _GaugeFuelState extends State<GaugeFuel> {
  double fuelLevel = 0;
  double previousVal = 0;
  Timer? _timer;

  void getTemp() async {
    const endPoint = ApiEndPoint.engfuelEndPoint;
    double newValue = await FirebaseService().fetchData(endPoint: endPoint);

    if (mounted) {
      if (newValue != previousVal) {
        setState(() {
          fuelLevel = newValue;
          previousVal = newValue;
          if (fuelLevel < 20) {
            NotificationService.showNotification(
              id: 4,
              channelKey: 'channel_1',
              title: 'fuel level'.toUpperCase(),
            );
          }
        });
      }
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
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.085,
          left: MediaQuery.of(context).size.height * 0.057,
          child: Image.asset(
            Assets.images.gasStation.path,
            width: 35,
          ),
        ),
        SfRadialGauge(
          animationDuration: 5,
          axes: <RadialAxis>[
            RadialAxis(
                startAngle: 180,
                endAngle: 0,
                showTicks: false,
                showAxisLine: false,
                showLabels: false,
                canScaleToFit: true,
                ranges: [
                  for (int i = 0; i < 10; i++)
                    GaugeRange(
                      startValue: i * 10,
                      endValue: (i + 1) * 10 - 1,
                      startWidth: 15,
                      endWidth: 15,
                      color: i == 0 ? Colors.red : Colors.white,
                    ),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                      value: fuelLevel,
                      enableAnimation: true,
                      needleEndWidth: 3,
                      // onValueChanged: _onPointerValueChanged,
                      needleStartWidth: 1,
                      needleColor: const Color.fromARGB(255, 255, 0, 0),
                      needleLength: 0.85,
                      knobStyle: const KnobStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          knobRadius: 0.09))
                ],
                annotations: const <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Text(
                        'E',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 247, 245, 98),
                        ),
                      ),
                      angle: 168,
                      positionFactor: 1),
                  GaugeAnnotation(
                      widget: Text(
                        'F',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 235, 238, 84),
                        ),
                      ),
                      angle: 12,
                      positionFactor: 0.95),
                ])
          ],
        ),
      ],
    );
  }
}
