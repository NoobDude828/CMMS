import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void handleLogout() {
    // Add functionality for logging out here
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/feedback': (context) => FeedbackScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Text(
          'College Mess Management System',
          style: TextStyle(fontSize: 13.0, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0028A8),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add functionality to navigate back
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Call the handleLogout function
            },
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Student',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color set to black
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 120,
                  height: 100,
                  color: const Color(0xFF0028A8),
                  child: Center(
                    child: Text(
                      'TimeTable/Menu',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/feedback');
                  },
                  child: Container(
                    width: 120,
                    height: 100,
                    color: const Color(0xFF0028A8),
                    child: Center(
                      child: Text(
                        'Feedback',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 100,
                  color: const Color(0xFF0028A8),
                  child: Center(
                    child: Text(
                      'BillReport',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF0028A8),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'About Us',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/CST-LOGO.png', height: 40),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail),
                label: 'Contact Us',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0028A8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Title:',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      maxLines: null,
                    ),
                    Text(
                      'Description:',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      maxLines: null,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality to submit feedback here
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
