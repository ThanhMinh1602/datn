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
  int previousVal = 0; // Giá trị trước đó
  Timer? _timer;

  void getTemp() async {
    const endPoint = ApiEndPoint.distanceEndPoint;
    int newValue = await FirebaseService().fetchDataInt(endPoint: endPoint);

    if (mounted) {
      if (newValue != previousVal) {
        setState(() {
          distance = newValue;
          previousVal = newValue;
          if (distance > 5000) {
            NotificationService.showNotification(
              id: 1,
              channelKey: 'channel_1',
              title: 'distance'.toUpperCase(),
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

// import 'dart:async';

// import 'package:datn/services/api_endpoint.dart';
// import 'package:datn/services/firebase_service.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:odometer/odometer.dart';

// class OdoWidget extends StatefulWidget {
//   const OdoWidget({super.key});

//   @override
//   State<OdoWidget> createState() => _OdoWidgetState();
// }

// class _OdoWidgetState extends State<OdoWidget> {
//   int? valfllvl = 0;
//   Timer? _timer;
// String formattedNumber(int? number) {
//   String numberString = (number ?? 0).toString(); // Check for null here

//   if (numberString.length < 6) {
//     numberString = numberString.padLeft(6, '0');
//   }

//   return numberString;
// }

//   void getFuel() async {
//     const endPoint = ApiEndPoint.distanceEndPoint;
//     valfllvl = await FirebaseService().fetchData(endPoint: endPoint);
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
//       getFuel();
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('ThanhMinh$valfllvl');
//     return Container(
//       padding:
//           const EdgeInsets.symmetric(horizontal: 20.0).copyWith(right: 10.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: Colors.black,
//       ),
//       child: AnimatedSlideOdometerNumber(
//         numberTextStyle: GoogleFonts.tektur(fontSize: 30, color: Colors.white),
//         odometerNumber: OdometerNumber(
//           int.parse(
//             formattedNumber(valfllvl),
//           ),
//         ),
//         duration: const Duration(milliseconds: 1000),
//         letterWidth: 30,
//       ),
//     );
//   }
// }
