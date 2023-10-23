import 'package:flutter/material.dart';
import 'Login.dart';
import 'placeOrder.dart';
import 'MessManager.dart';
import 'PlanTimetable.dart';
//import 'SubmitReport.dart';
import 'Student.dart';
import 'Administrator.dart';
//import 'ViewExpenditure.dart';
import 'ProvideFeedback.dart';
//import 'ViewMenu.dart';
//import 'ViewFeedback.dart';
//import 'ValidateReport.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login', // Set the initial route to the login page
      routes: {
        '/login': (context) => const Login(), // Add the login route
        '/MessManager': (context) => const MessManagerScreen(),
        '/placeOrder': (context) => const PlaceOrderScreen(),
        '/planTimetable': (context) => const PlanTimetableScreen(),
        //'/submitReport': (context) => const SubmitReportScreen(),
       // '/viewFeedback': (context) => ViewFeedbackScreen(),
        '/student':(context) => const StudentScreen(),
        '/administrator':(context) => const AdministratorScreen(),
        //'/viewExpenditure':(context) => const ViewExpenditureScreen(),
        '/provideFeedback':(context) => const ProvideFeedbackScreen(),
       // '/viewMenu':(context) => ViewMenuScreen(),
       // '/validateReport':(context) => ValidateReportScreen(),
      },
    );
  }
}

class MessManagerScreen extends StatelessWidget {
  const MessManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text(
          'College Mess Management System',
          style: TextStyle(fontSize: 13.0),
        ),
        backgroundColor: const Color(0xFF0028A8),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/login'));
            },
          ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        )
      ),
       actions: [
       IconButton(
        icon: const Icon(Icons.logout), 
        onPressed: () {
       Navigator.of(context).popUntil(ModalRoute.withName('/login'));
           },
          ),
        ],
      ),
      body: MessManager(), 
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
                  icon: Icon(Icons.info), // Icon for About Us
                  label: 'About Us',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/CST-LOGO.jpg', height: 40), // Static Logo
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), // Icon for Contact Us
                  label: 'Contact Us',
                ),
              ],
            ),
          ),
        ),
    );
  }
}
class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text(
          'College Mess Management System',
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
        backgroundColor: const Color(0xFF0028A8),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(45),
        bottomRight: Radius.circular(45),
      )
    ),
      actions: [
       IconButton(
        icon: const Icon(Icons.logout), // You can use the appropriate icon
        onPressed: () {
        Navigator.of(context).popUntil(ModalRoute.withName('/login'));
          },
        ),
     ],
      ),
      body: const PlaceOrder(),

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
                  icon: Icon(Icons.info), // Icon for About Us
                  label: 'About Us',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/CST-LOGO.jpg', height: 40), // Static Logo
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), // Icon for Contact Us
                  label: 'Contact Us',
                ),
              ],
            ),
          ),
        ),
        
    );
  }
}

class PlanTimetableScreen extends StatelessWidget {
  const PlanTimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text(
          'College Mess Management System',
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
        backgroundColor: const Color(0xFF0028A8),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add functionality to navigate back
            Navigator.pop(context);
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
             Navigator.of(context).popUntil(ModalRoute.withName('/login'));
            },
          ),
        ],
      ),
      body: PlanTimetable(), // Display the body content from PlanTimetable.dart

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
                  icon: Icon(Icons.info), // Icon for About Us
                  label: 'About Us',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/CST-LOGO.jpg', height: 40), // Static Logo
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), // Icon for Contact Us
                  label: 'Contact Us',
                ),
              ],
            ),
          ),
        ),

    );
  }
}

/*
class SubmitReportScreen extends StatelessWidget {
  const SubmitReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text(
          'College Mess Management System',
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
        backgroundColor: const Color(0xFF0028A8),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add functionality to navigate back
            Navigator.pop(context);
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/login'));
            },
          ),
        ],
      ),
      body: SubmitReport(), // Display the body content from PlanTimetable.dart
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
                  icon: Icon(Icons.info), // Icon for About Us
                  label: 'About Us',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/CST-LOGO.jpg', height: 40), // Static Logo
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), // Icon for Contact Us
                  label: 'Contact Us',
                ),
              ],
            ),
          ),
        ),

    );
  }
}
*/
/*
class ViewFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text(
          'College Mess Management System',
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
        backgroundColor: const Color(0xFF0028A8),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add functionality to navigate back
            Navigator.pop(context);
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/login'));
            },
          ),
        ],
      ),
      body: viewFeedback(), // Display the body content from PlanTimetable.dart

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
                  icon: Icon(Icons.info), // Icon for About Us
                  label: 'About Us',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/CST-LOGO.jpg', height: 40), // Static Logo
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), // Icon for Contact Us
                  label: 'Contact Us',
                ),
              ],
            ),
          ),
        ),
    );
  }
}
*/
class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text(
          'College Mess Management System',
          style: TextStyle(fontSize: 13.0),
        ),
        backgroundColor: const Color(0xFF0028A8),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/login'));
            },
          ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        )
      ),
       actions: [
       IconButton(
        icon: const Icon(Icons.logout), 
        onPressed: () {
       Navigator.of(context).popUntil(ModalRoute.withName('/login'));
           },
          ),
        ],
      ),
      body: Student(),
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
                  icon: Icon(Icons.info), // Icon for About Us
                  label: 'About Us',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/CST-LOGO.jpg', height: 40), // Static Logo
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), // Icon for Contact Us
                  label: 'Contact Us',
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class AdministratorScreen extends StatelessWidget {
  const AdministratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text(
          'College Mess Management System',
          style: TextStyle(fontSize: 13.0),
        ),
        backgroundColor: const Color(0xFF0028A8),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/login'));
            },
          ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        )
      ),
       actions: [
       IconButton(
        icon: const Icon(Icons.logout), 
        onPressed: () {
       Navigator.of(context).popUntil(ModalRoute.withName('/login'));
           },
          ),
        ],
      ),
      body: const Administrator(),
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
                  icon: Icon(Icons.info), // Icon for About Us
                  label: 'About Us',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/CST-LOGO.jpg', height: 40), // Static Logo
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), // Icon for Contact Us
                  label: 'Contact Us',
                ),
              ],
            ),
          ),
        ),
    );
  }
}

/*
class ViewExpenditureScreen extends StatelessWidget {
  const ViewExpenditureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text(
          'College Mess Management System',
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
        backgroundColor: const Color(0xFF0028A8),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add functionality to navigate back
            Navigator.pop(context);
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/login'));
            },
          ),
        ],
      ),
      body: ViewExpenditure(), // Display the body content from PlanTimetable.dart
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
                  icon: Icon(Icons.info), // Icon for About Us
                  label: 'About Us',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/CST-LOGO.jpg', height: 40), // Static Logo
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), // Icon for Contact Us
                  label: 'Contact Us',
                ),
              ],
            ),
          ),
        ),
    );
  }
}
*/
class ProvideFeedbackScreen extends StatelessWidget {
  const ProvideFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text(
          'College Mess Management System',
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
        backgroundColor: const Color(0xFF0028A8),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add functionality to navigate back
            Navigator.pop(context);
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/login'));
            },
          ),
        ],
      ),
      body: ProvideFeedback(), // Display the body content from PlanTimetable.dart
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
                  icon: Icon(Icons.info), // Icon for About Us
                  label: 'About Us',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/CST-LOGO.jpg', height: 40), // Static Logo
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), // Icon for Contact Us
                  label: 'Contact Us',
                ),
              ],
            ),
          ),
        ),
    );
  }
}
/*
class ViewMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text(
          'College Mess Management System',
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
        backgroundColor: const Color(0xFF0028A8),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add functionality to navigate back
            Navigator.pop(context);
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/login'));
            },
          ),
        ],
      ),
      body: ViewMenu(), // Display the body content from PlanTimetable.dart
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
                  icon: Icon(Icons.info), // Icon for About Us
                  label: 'About Us',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/CST-LOGO.jpg', height: 40), // Static Logo
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), // Icon for Contact Us
                  label: 'Contact Us',
                ),
              ],
            ),
          ),
        ),
    );
  }
}
*/
