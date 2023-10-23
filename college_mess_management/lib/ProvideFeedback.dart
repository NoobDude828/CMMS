import 'package:flutter/material.dart';

class ProvideFeedback extends StatelessWidget {
  const ProvideFeedback({super.key});

  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Center(
              child: Text(
                'Provide Your Feedback',
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
