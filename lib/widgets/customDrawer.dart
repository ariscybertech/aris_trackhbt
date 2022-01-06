import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tack_habit/screens/provider/themeProvider.dart';

class CustomDrawerScreen extends StatefulWidget {
  @override
  _CustomDrawerScreenState createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[800], Colors.black],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: height,
                width: width * .5,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .1,
                      width: width * .5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      height: height * .15,
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Text(
                      "User Name",
                      style: GoogleFonts.varelaRound(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      width: width * .45,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Profile",
                            style: GoogleFonts.varelaRound(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      width: width * .45,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Settings",
                            style: GoogleFonts.varelaRound(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * .1),
                    ThemeButton(),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      width: width * .45,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Log Out",
                            style: GoogleFonts.varelaRound(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ZoomDrawer.of(context).close();
              },
              child: SizedBox(
                width: width * .5,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20, bottom: 30),
                    height: height * .05,
                    width: width * .3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      width: width * .45,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "CLOSE ",
                            style: GoogleFonts.varelaRound(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeButton extends StatefulWidget {
  @override
  _ThemeButtonState createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    final int themeVal =
        Provider.of<ThemeProvider>(context, listen: false).themeValue;
    return InkWell(
      onTap: () {
        if (themeVal == 0) {
          Provider.of<ThemeProvider>(context, listen: false)
              .changeThemeToDark();
        } else {
          Provider.of<ThemeProvider>(context, listen: false)
              .changeThemeToLight();
        }
        setState(() {});
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .2,
        height: 50,
        // color: Colors.blue,
        child: (themeVal == 0)
            ? Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(49),
                        ),
                      ),
                      height: 10,
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                  ),
                  Positioned(
                    left: 5,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.wb_sunny_rounded,
                        color: Colors.orange,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(49),
                        ),
                      ),
                      height: 10,
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.nightlight_round,
                        color: Colors.grey[800],
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
