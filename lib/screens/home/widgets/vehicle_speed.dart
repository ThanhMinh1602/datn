import 'dart:async';
import 'package:datn/services/api_endpoint.dart';
import 'package:datn/services/firebase_service.dart';
import 'package:datn/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class VehicleSpeed extends StatefulWidget {
  const VehicleSpeed({super.key});

  @override
  State<VehicleSpeed> createState() => _VehicleSpeedState();
}

class _VehicleSpeedState extends State<VehicleSpeed> {
  double vehicleSpeed = 0;
  double previousVal = 0; // Giá trị trước đó
  Timer? _timer;

  void getTemp() async {
    const endPoint = ApiEndPoint.vehicleSpeedEndPoint;
    double newValue = await FirebaseService().fetchData(endPoint: endPoint);

    if (mounted) {
      if (newValue != previousVal) {
        setState(() {
          vehicleSpeed = newValue;
          previousVal = newValue;
          if (vehicleSpeed > 100) {
            NotificationService.showNotification(
              id: 5,
              channelKey: 'channel_1',
              title: 'vehicle speed'.toUpperCase(),
              body:
                  'Vận tốc $vehicleSpeed',
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
            minorTicksPerInterval: 4,
            majorTickStyle: const MajorTickStyle(
                length: 5,
                thickness: 3,
                color: Color.fromARGB(255, 15, 15, 15)),
            minorTickStyle: const MinorTickStyle(
                length: 1,
                thickness: 1.5,
                color: Color.fromARGB(255, 10, 10, 10)),
            axisLabelStyle: const GaugeTextStyle(
                color: Color.fromARGB(255, 3, 32, 109),
                fontWeight: FontWeight.bold,
                fontSize: 13),
            labelOffset: 0.8,
            onLabelCreated: labelCreated),
        RadialAxis(
          minimum: 0,
          maximum: 200,
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
          interval: 30,
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
                value: vehicleSpeed,
                needleLength: 0.95,
                enableAnimation: true,
                animationType: AnimationType.ease,
                needleStartWidth: 1,
                needleEndWidth: 3,
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
                  Text('Km/h',
                      style: TextStyle(
                          fontSize: 18,
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
