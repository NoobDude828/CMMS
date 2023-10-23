//import 'package:college_mess_management/main.dart';
import 'package:flutter/material.dart';

class MessManager extends StatelessWidget {
  const MessManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Mess Manager',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Add the Image widget below the text
            Image.asset(
              'images/MessManager.jpg', // Replace with your image asset path
              width: 200, // Set the width to your desired value
              height: 200, // Set the height to your desired value
            ),
            // Two buttons at the top
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {

                        Navigator.pushNamed(context, '/planTimetable');
                     
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6600),
                        minimumSize: const Size(100, 100),
                      ),
                      child: const Text('Plan Timetable',
                      style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 20), // Add space between buttons
                    TextButton(
                      onPressed: () {
                       
                        Navigator.pushNamed(context, '/placeOrder');

                      },
                       style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6600),
                        minimumSize: const Size(135, 100),
                      ),
                      child: const Text('Place Order',
                      style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                const SizedBox(width: 16), // Adjust spacing between button columns
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        
                        Navigator.pushNamed(context, '/submitReport');

                      },
                       style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6600),
                        minimumSize: const Size(100, 100),
                      ),
                      child: const Text('Submit Report',
                      style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 20), // Add space between buttons
                    ElevatedButton(
                      onPressed: () {

                        Navigator.pushNamed(context, '/viewFeedback');
                       
                      },
                       style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6600),
                        minimumSize: const Size(100, 100),
                      ),
                      child: const Text('View Feedback',
                      style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
