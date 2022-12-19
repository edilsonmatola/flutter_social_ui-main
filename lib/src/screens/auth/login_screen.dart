import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common_widgets/primary_button.dart';
import '../../core/constants/image_constant.dart';
import '../../core/utils/curve_clipper_util.dart';
import '../home/home_export.dart';
import 'widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      ImageConstant.loginBackgroundImage,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'A E M',
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: CustomTextField(
                    icon: FontAwesomeIcons.user,
                    hintText: 'Username',
                    isObscure: false,
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
                  child: CustomTextField(
                    icon: FontAwesomeIcons.lock,
                    isSecret: true,
                    hintText: 'Password',
                    isObscure: true,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                PrimaryButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (context) => const HomeScreen(),
                    ),
                  ),
                  buttonTitle: 'Log In',
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't you have an account?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
