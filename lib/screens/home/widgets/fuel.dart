import 'dart:async';

import 'package:datn/services/api_endpoint.dart';
import 'package:datn/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeFuel extends StatefulWidget {
  const GaugeFuel({
    super.key,
  });
  State<GaugeFuel> createState() => _GaugeFuelState();
}

class _GaugeFuelState extends State<GaugeFuel> {
  late double FuelLvlVal = 0;
  late bool OverFl = false;
  double? valfllvl;
  Timer? _timer;

  void getFuel() async {
    const endPoint = ApiEndPoint.engfuelEndPoint;
    valfllvl = await FirebaseService().fetchData(endPoint: endPoint);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      getFuel();
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
      animationDuration: 5,
      axes: <RadialAxis>[
        RadialAxis(
            startAngle: 180,
            endAngle: 0,
            showTicks: false,
            showAxisLine: false,
            showLabels: false,
            canScaleToFit: true,
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 0,
                  endValue: 10,
                  startWidth: 10,
                  endWidth: 12.5,
                  color: _color1),
              GaugeRange(
                  startValue: 12,
                  endValue: 20,
                  startWidth: 12.5,
                  endWidth: 15,
                  color: _color2),
              GaugeRange(
                  startValue: 22,
                  endValue: 30,
                  startWidth: 15,
                  endWidth: 17.5,
                  color: _color3),
              GaugeRange(
                  startValue: 32,
                  endValue: 40,
                  startWidth: 17.5,
                  endWidth: 20,
                  color: _color4),
              GaugeRange(
                  startValue: 42,
                  endValue: 50,
                  startWidth: 20,
                  endWidth: 22.5,
                  color: _color5),
              GaugeRange(
                  startValue: 52,
                  endValue: 60,
                  startWidth: 22.5,
                  endWidth: 25,
                  color: _color6),
              GaugeRange(
                  startValue: 62,
                  endValue: 70,
                  startWidth: 25,
                  endWidth: 27.5,
                  color: _color7),
              GaugeRange(
                  startValue: 72,
                  endValue: 80,
                  startWidth: 27.5,
                  endWidth: 30,
                  color: _color8),
              GaugeRange(
                  startValue: 82,
                  endValue: 90,
                  startWidth: 30,
                  endWidth: 32.5,
                  color: _color9),
              GaugeRange(
                  startValue: 92,
                  endValue: 100,
                  startWidth: 32.5,
                  endWidth: 35,
                  color: _color10)
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                  value: valfllvl ?? 0,
                  enableAnimation: true,
                  needleEndWidth: 7,
                  // onValueChanged: _onPointerValueChanged,
                  needleStartWidth: 1,
                  needleColor:
                      const Color.fromARGB(255, 12, 12, 12),
                  needleLength: 0.85,
                  knobStyle: const KnobStyle(
                      color: Color.fromARGB(255, 17, 17, 17),
                      knobRadius: 0.09))
            ],
            annotations: <GaugeAnnotation>[
              // GaugeAnnotation(
              //     widget: Container(
              //         width: 30.00,
              //         height: 30.00,
              //         decoration: const BoxDecoration(
              //           image: DecorationImage(
              //             image: ExactAssetImage(''),
              //             fit: BoxFit.fill,
              //           ),
              //         )),
              //     angle: 270,
              //     positionFactor: 0.35),
              const GaugeAnnotation(
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
              const GaugeAnnotation(
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
    );
  }

  void _onSecondRangeColorChanged() {
    _color1 = Colors.white;
    _color2 = Colors.red;
    _color3 = Colors.white;
    _color4 = Colors.white;
    _color5 = Colors.white;
    _color6 = Colors.white;
    _color7 = Colors.white;
    _color8 = Colors.white;
    _color9 = Colors.white;
    _color10 = Colors.white;
  }

  void _onThirdRangeColorChanged() {
    _color1 = Colors.white;
    _color2 = Colors.white;
    _color3 = Colors.red;
    _color4 = Colors.white;
    _color5 = Colors.white;
    _color6 = Colors.white;
    _color7 = Colors.white;
    _color8 = Colors.white;
    _color9 = Colors.white;
    _color10 = Colors.white;
  }

  void _onFourthRangeColorChanged() {
    _color1 = Colors.white;
    _color2 = Colors.white;
    _color3 = Colors.white;
    _color4 = Colors.red;
    _color5 = Colors.white;
    _color6 = Colors.white;
    _color7 = Colors.white;
    _color8 = Colors.white;
    _color9 = Colors.white;
    _color10 = Colors.white;
  }

  void _onFifthRangeColorChanged() {
    _color1 = Colors.white;
    _color2 = Colors.white;
    _color3 = Colors.white;
    _color4 = Colors.white;
    _color5 = Colors.red;
    _color6 = Colors.white;
    _color7 = Colors.white;
    _color8 = Colors.white;
    _color9 = Colors.white;
    _color10 = Colors.white;
  }

  void _onSixthRangeColorChanged() {
    _color1 = Colors.white;
    _color2 = Colors.white;
    _color3 = Colors.white;
    _color4 = Colors.white;
    _color5 = Colors.white;
    _color6 = Colors.red;
    _color7 = Colors.white;
    _color8 = Colors.white;
    _color9 = Colors.white;
    _color10 = Colors.white;
  }

  void _onSeventhRangeColorChanged() {
    _color1 = Colors.white;
    _color2 = Colors.white;
    _color3 = Colors.white;
    _color4 = Colors.white;
    _color5 = Colors.white;
    _color6 = Colors.white;
    _color7 = Colors.red;
    _color8 = Colors.white;
    _color9 = Colors.white;
    _color10 = Colors.white;
  }

  void _onEighthRangeColorChanged() {
    _color1 = Colors.white;
    _color2 = Colors.white;
    _color3 = Colors.white;
    _color4 = Colors.white;
    _color5 = Colors.white;
    _color6 = Colors.white;
    _color7 = Colors.white;
    _color8 = Colors.red;
    _color9 = Colors.white;
    _color10 = Colors.white;
  }

  void _onNinethRangeColorChanged() {
    _color1 = Colors.white;
    _color2 = Colors.white;
    _color3 = Colors.white;
    _color4 = Colors.white;
    _color5 = Colors.white;
    _color6 = Colors.white;
    _color7 = Colors.white;
    _color8 = Colors.white;
    _color9 = Colors.red;
    _color10 = Colors.white;
  }

  void _onTenthRangeColorChanged() {
    _color1 = Colors.white;
    _color2 = Colors.white;
    _color3 = Colors.white;
    _color4 = Colors.red;
    _color5 = Colors.white;
    _color6 = Colors.white;
    _color7 = Colors.white;
    _color8 = Colors.white;
    _color9 = Colors.white;
    _color10 = Colors.red;
  }

  Color _color1 = Colors.red;
  Color _color2 = Colors.white;
  Color _color3 = Colors.white;
  Color _color4 = Colors.white;
  Color _color5 = Colors.white;
  Color _color6 = Colors.white;
  Color _color7 = Colors.white;
  Color _color8 = Colors.white;
  Color _color9 = Colors.white;
  Color _color10 = Colors.white;
}
