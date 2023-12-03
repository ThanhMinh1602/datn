// import 'package:flutter/material.dart';
// import 'package:odometer/odometer.dart';

// class GaugeOdo extends StatefulWidget {
//   const GaugeOdo({super.key});

//   @override
//   State<GaugeOdo> createState() => _GaugeOdoState();
// }

// class TemperatureData {
//   final String hour;
//   final int temperature;

//   TemperatureData(this.hour, this.temperature);
// }

// class _GaugeOdoState extends State<GaugeOdo> {
//   late bool odocon = false;
//   late double MilVal = 0;
//   late double odoval = 0;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: double.infinity,
//           height: double.infinity,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(3, 55, 0, 0),
//                   child: Container(
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.white10,
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: AnimatedSlideOdometerNumber(
//                         groupSeparator: Container(
//                           decoration: const BoxDecoration(
//                             color: Colors.black,
//                           ),
//                         ),
//                         odometerNumber: OdometerNumber(odoval.toInt()),
//                         duration: const Duration(milliseconds: 1000),
//                         letterWidth: 25,
//                         numberTextStyle: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//                   child: SizedBox(
//                     width: 200,
//                     height: 79,
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "ODOMETER".toUpperCase(),
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .displaySmall!
//                                 .copyWith(
//                                     color: const Color.fromARGB(255, 210, 239, 250),
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 25),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
