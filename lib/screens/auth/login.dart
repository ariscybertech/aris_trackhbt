import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tack_habit/screens/auth/forgotPass.dart';
import 'package:tack_habit/screens/auth/signup.dart';
import 'package:tack_habit/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double height;
  double width;
  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;
  bool _showPassword = false;
  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _requestEmailFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_emailFocusNode);
    });
  }

  void _requestPasswordFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_passwordFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Spacer
            SizedBox(
              height: height * .05,
              width: width,
            ),
            // Animated Text
            Container(
              height: height * .1,
              width: width,
              padding: EdgeInsets.only(right: width * .15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(width: 20.0, height: 100.0),
                  RotateAnimatedTextKit(
                    repeatForever: true,
                    text: const ["BREAK", "MAKE", "TRACK"],
                    textStyle: GoogleFonts.varelaRound(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20.0, height: 100.0),
                  Text(
                    "Habit",
                    style: GoogleFonts.varelaRound(
                      fontSize: 43,
                    ),
                  ),
                ],
              ),
            ),
            // Simple Text
            SizedBox(
              height: height * .1,
              width: width * .9,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Login to Start your Journey!",
                    style: GoogleFonts.varelaRound(
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
            // Login form
            SizedBox(
              width: width * .9,
              height: height * .3,
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        focusNode: _emailFocusNode,
                        onTap: _requestEmailFocus,
                        style: GoogleFonts.varelaRound(),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: (_emailFocusNode.hasFocus)
                                ? Colors.black
                                : Colors.grey,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          labelText: (_emailFocusNode.hasFocus)
                              ? "e-mail"
                              : "\te-mail",
                          labelStyle: GoogleFonts.varelaRound(
                            color: (_emailFocusNode.hasFocus)
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 25,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        obscureText: !_showPassword,
                        focusNode: _passwordFocusNode,
                        onTap: _requestPasswordFocus,
                        style: GoogleFonts.varelaRound(),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: (_passwordFocusNode.hasFocus)
                                ? Colors.black
                                : Colors.grey,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  _showPassword = !_showPassword;
                                },
                              );
                            },
                            child: Icon(
                              _showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _showPassword ? Colors.black : Colors.grey,
                            ),
                          ),
                          labelText: (_passwordFocusNode.hasFocus)
                              ? "password"
                              : "\tpassword",
                          labelStyle: GoogleFonts.varelaRound(
                            color: (_passwordFocusNode.hasFocus)
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 25,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // forget password
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return ForgotPass();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: SizedBox(
                height: height * .05,
                width: width * .8,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.varelaRound(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //login
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return HomeScreenDrawer();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: height * .04,
                ),
                height: height * .06,
                width: width * .6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Log In",
                    style: GoogleFonts.varelaRound(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // space
            SizedBox(
              height: height * .1,
            ),
            // signup
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return SignUpScreen();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: height * .02,
                  bottom: height * .02,
                ),
                height: height * .06,
                width: width * .6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Do not have an account? Sign Up!",
                    style: GoogleFonts.varelaRound(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // space
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      ),
    );
  }
}

/*

  h => height of the screen
  w => width of the screen

  Structure of the screen:
    0- Space h*.05
    1- Animated Text  h*.1
    2- Login to Start Your Journey h*.05
    3- Login Form h*.3
    4- Forgot Password h*.05
    5- Login h*.1
    6- Space h*.2
    7- Sign up h*.1
    8- Space  h*.05

*/
