import 'dart:async';
import 'package:datn/services/api_endpoint.dart';
import 'package:datn/services/firebase_service.dart';
import 'package:datn/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odometer/odometer.dart';

class OdoWidget extends StatefulWidget {
  const OdoWidget({super.key});

  @override
  State<OdoWidget> createState() => _OdoWidgetState();
}

class _OdoWidgetState extends State<OdoWidget> {
  int distance = 999999;
  int oldDisrance = 0;
  int previousVal = 0;
  Timer? _timer;

  void getTemp() async {
    const endPoint = ApiEndPoint.distanceEndPoint;
    int newValue = await FirebaseService().fetchDataInt(endPoint: endPoint);

    if (mounted && newValue > previousVal + 1000) {
      setState(() {
        distance = newValue;
        if (distance > oldDisrance + 1000) {
          oldDisrance += 1000;
          previousVal = newValue;
          NotificationService.showNotification(
            id: 1,
            channelKey: 'channel_1',
            title: 'distance'.toUpperCase(),
          );
        }
      });
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
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 20.0).copyWith(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black,
      ),
      child: AnimatedSlideOdometerNumber(
        numberTextStyle: GoogleFonts.tektur(fontSize: 30, color: Colors.white),
        odometerNumber: OdometerNumber(
          distance,
        ),
        duration: const Duration(milliseconds: 300),
        letterWidth: 30,
      ),
    );
  }
}
