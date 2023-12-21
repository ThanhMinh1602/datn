import 'package:flutter/material.dart';

class OdoWidget extends StatefulWidget {
  const OdoWidget({super.key});

  @override
  State<OdoWidget> createState() => _OdoWidgetState();
}

class _OdoWidgetState extends State<OdoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) => Container()),
    );
  }
}
