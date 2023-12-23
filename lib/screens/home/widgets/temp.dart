import 'dart:async';
import 'package:datn/gen/assets.gen.dart';
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
  double valengtmp = 0;
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
    return SfRadialGauge(
      axes: [
        RadialAxis(
          minimum: 0,
          maximum: 240,
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
          interval: 20,
          ranges: [
            GaugeRange(
              startValue: 0,
              endValue: 240,
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
                value: valengtmp,
                needleLength: 0.95,
                enableAnimation: true,
                animationType: AnimationType.ease,
                needleStartWidth: 1,
                needleEndWidth: 3,
                needleColor: const Color.fromARGB(255, 64, 0, 0),
                knobStyle: const KnobStyle(
                    knobRadius: 0.09,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: Color.fromARGB(255, 15, 15, 15)))
          ],
          annotations: [
            GaugeAnnotation(
              verticalAlignment: GaugeAlignment.near,
              widget: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset(
                  Assets.images.engineCoolant.path,
                  width: 40,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
