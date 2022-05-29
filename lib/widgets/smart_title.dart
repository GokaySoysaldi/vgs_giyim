import 'package:flutter/material.dart';

class SmartTitle extends StatelessWidget {
  final String title;
  const SmartTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Align(alignment: Alignment.topLeft ,child: Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
    );
  }
}