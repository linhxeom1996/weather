import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Calendar Page",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}
