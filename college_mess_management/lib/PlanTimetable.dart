import 'package:flutter/material.dart';

class PlanTimetable extends StatelessWidget {
  const PlanTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Center(
              child: Text(
                'Plan your Menu for the Week',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            // Add body your content here
          ],
        ),
      ),
    );
  }
}
