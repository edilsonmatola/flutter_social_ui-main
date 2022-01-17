import 'package:flutter/material.dart';
import '../widgets/curve_clipper.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          /*Scroll view takes all the screen*/
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Image(
                  height: MediaQuery.of(context).size.height / 2.5,
                  /* Fills the entire width of the container */
                  width: double.infinity,
                  /* To fill up to the top of the screen */
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/login_background.jpg',
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'INSTACOPY',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    /* Color of the inside of the text field */
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Username',
                    prefixIcon: Icon(
                      Icons.account_circle_outlined,
                      size: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    /* Color of the inside of the text field */
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      size: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (context) => const HomeScreen(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              /* Expanded will align the container to the bottom center
              * Fixed to the bottom */
              //TODO: Use a TextButton to do the Sign in
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      color: Theme.of(context).primaryColor,
                      height: 70,
                      child: Text(
                        "Don't have an account? Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
