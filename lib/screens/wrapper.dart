import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tack_habit/screens/auth/login.dart';
import 'package:tack_habit/screens/provider/themeProvider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context, listen: false).getCurrentTheme();
    /*
      Wrapper is the class which examine if the user is loged in or not and
      based on that will take the user to the desired screen. If the user will
      be loged in, he will be taken to the homescreen else he will be taken to
      the log in screen.
      ** I will not be adding authentication in the open source.
      So this will automatically take the user to log in screen.
     */
    return LoginScreen();
  }
}
