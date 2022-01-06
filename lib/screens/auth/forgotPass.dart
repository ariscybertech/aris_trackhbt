import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  double height;
  double width;
  String email = "";
  FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _requestEmailFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_emailFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // space .05
            SizedBox(
              height: height * .05,
              width: width,
            ),
            // forgot password 0.05
            SizedBox(
              height: height * .05,
              width: width * .6,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Forgot Your Password?",
                  style: GoogleFonts.varelaRound(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // do not worry we are here for you .05
            SizedBox(
              height: height * .05,
              width: width * .8,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Don't worry we are here for you.",
                  style: GoogleFonts.varelaRound(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            // space .05
            SizedBox(
              height: height * .05,
            ),
            // email field .1
            SizedBox(
              width: width * .8,
              height: height * .1,
              child: TextField(
                focusNode: _emailFocusNode,
                onTap: _requestEmailFocus,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color:
                        (_emailFocusNode.hasFocus) ? Colors.black : Colors.grey,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                    ),
                  ),
                  labelText: (_emailFocusNode.hasFocus) ? "e-mail" : "\te-mail",
                  labelStyle: GoogleFonts.varelaRound(
                    color:
                        (_emailFocusNode.hasFocus) ? Colors.black : Colors.grey,
                    fontSize: 25,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            // space  .05
            SizedBox(
              height: height * .05,
            ),
            // Get Email  .1
            InkWell(
              child: Container(
                margin: EdgeInsets.only(
                  top: height * .04,
                ),
                height: height * .06,
                width: width * .6,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Get Email",
                        style: GoogleFonts.varelaRound(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: width * .05,
                      ),
                      const Icon(
                        Icons.forward_to_inbox_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // space *.1
            SizedBox(
              height: height * .1,
            ),
            // Login or sign up *.2
            SizedBox(
              height: height * 0.1,
              width: width * .8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.black,
                    height: height * .06,
                    width: width * .3,
                    child: Center(
                      child: Text(
                        "LogIn",
                        style: GoogleFonts.varelaRound(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    " - OR - ",
                    style: GoogleFonts.varelaRound(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    height: height * .06,
                    width: width * .3,
                    child: Center(
                      child: Text(
                        "SignUp",
                        style: GoogleFonts.varelaRound(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //space remaing
          ],
        ),
      ),
    );
  }
}

/*

  Layout of the forgot password screen:

  AppBar

  Text h*.1

  InputField h*.1

  Get Email. h *.06
  
  
  
  
  -> login and signup will be in a row with or inside
  Login     h*.06

  Signup    h*.06


*/

/*
  Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return AddListScreen();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            )
*/
