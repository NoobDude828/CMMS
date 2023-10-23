import 'package:flutter/material.dart';
//import 'package:college_mess_management/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Color mycolor;
  late Size mediaSize;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mycolor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
      child: Center(
        child: Padding(
          // Setting Padding for the images
          padding: const EdgeInsets.only(top: 0.0), // Adjust the top padding as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                constraints:
                    const BoxConstraints(maxHeight: 200, maxWidth: double.infinity),
                decoration: BoxDecoration(
                  color: mycolor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                    bottomLeft: Radius.elliptical(700, 590),
                    bottomRight: Radius.elliptical(700, 590),
                  ),
                  image: DecorationImage(
                    image: const AssetImage('Images/basketball_Login.jpg'),
                    fit: BoxFit.fitWidth,
                    colorFilter: ColorFilter.mode(
                        const Color(0xFF0028A8).withOpacity(0.4), BlendMode.dstATop),
                  ),
                ),
              ),

              // Expanding the remaining vertical spaces
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Container(
                        color: Colors.white,
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xFF0028A8),
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),

                      // Adding an email address and a password field
                      const SizedBox(height: 20), // Add some space

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset('Images/email.svg'),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10), // Add some space
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset('Images/password.svg'),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset('Images/password_hide.svg'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),

                      // Login Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xff0028a8),
                                Color(0xff2a54d5),
                                Color(0xff0028a8),
                              ],
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              final enteredEmail = emailController.text; // Get the entered email from the text field.
                              final enteredPassword =
                                  passwordController.text; // Get the entered password from the text field.

                              if (enteredEmail == '1' && enteredPassword == '1') {
                                // Navigate to the Mess Manager Interface.
                                Navigator.pushNamed(context, '/MessManager');
                              }
                              else if(enteredEmail=='2'&& enteredPassword=='2'){
                                Navigator.pushNamed(context, '/student');
                              }else if(enteredEmail=='3'&& enteredPassword=='3'){
                                Navigator.pushNamed(context, '/administrator');
                              }
                              else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Login Failed'),
                                      content: const Text('Invalid email or password.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Add space between buttons and "Or"
                      const SizedBox(height: 30),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Or',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Sign up using Google button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your sign up with Google action here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(188, 255, 255, 255),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'Images/google_logo.jpg',
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Sign Up with Google',
                                style: TextStyle(
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
