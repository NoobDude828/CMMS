import 'package:flutter/material.dart';

class Administrator extends StatelessWidget {
  const Administrator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Administrator',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Replace 'images/Student.jpg' with your image asset path
            Image.asset(
              'images/Administrator.jpg',
              width: 200,
              height: 200,
            ),
            // One button at the top
            const SizedBox(height: 20), // Add space between the image and the button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/viewExpenditure');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6600),
                minimumSize: const Size(148, 100), // Adjust button size
              ),
              child: const Text(
                'Asses Report',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
