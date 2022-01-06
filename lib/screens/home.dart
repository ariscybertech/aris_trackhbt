import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tack_habit/screens/addHabit.dart';
import 'package:tack_habit/screens/provider/themeProvider.dart';
import 'package:tack_habit/style.dart';
import 'package:tack_habit/widgets/bottomNavigation.dart';
import 'package:tack_habit/widgets/customDrawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int themeValue = 0;
  final ZoomDrawerController _controller = ZoomDrawerController();
  double height, width;
  @override
  Widget build(BuildContext context) {
    themeValue = Provider.of<ThemeProvider>(context).themeValue;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: ZoomDrawer(
        controller: _controller,
        menuScreen: HomeScreen(),
        mainScreen: CustomDrawerScreen(),
        slideWidth: MediaQuery.of(context).size.width * .5,
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: (themeValue == 0) ? Colors.black : Colors.white,
          iconSize: 30,
          onPressed: () {
            ZoomDrawer.of(context).open();
          },
        ),
        backgroundColor: (themeValue == 0) ? Colors.white : Colors.black,
        centerTitle: true,
        elevation: 0,
        title: SizedBox(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Your Day So Far",
              style: GoogleFonts.varelaRound(
                fontSize: 40,
                color: (themeValue == 0) ? lightFontColor : darkFontColor,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "addTask",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddHabitScreen(),
            ),
          );
        },
        backgroundColor: (themeValue == 1) ? darkFABColor : lightFABColor,
        child: Icon(
          Icons.add_chart,
          color: (themeValue == 1) ? darkFABIconColor : lightFABIconColor,
          size: height * .035,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: (themeValue == 0) ? lightBgColor : darkBgColor,
      bottomNavigationBar: BottomNavigation(0, themeValue),
      body: Container(
        padding: EdgeInsets.only(top: height * 0.05, left: width * .05),
        height: height * .9,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Random Insipiration Quote - Regarding Book h*.15
            Container(
              width: width * .9,
              margin: EdgeInsets.only(
                top: height * .02,
              ),
              height: height * .13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: (themeValue == 0) ? lightBorderColor : darkBorderColor,
                  width: 3,
                ),
              ),
            ),

            // ! delete the widget below

            SizedBox(
              height: height * .05,
            ),
            // Check List
            Container(
              height: height * .1,
              width: width * .9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color:
                        (themeValue == 0) ? lightBorderColor : darkBorderColor,
                    width: 2),
              ),
              child: Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        ZoomDrawer.of(context).open();
                      },
                      child: Text(
                        "Task Name",
                        style: GoogleFonts.varelaRound(
                          fontSize: 30,
                          color: (themeValue == 0)
                              ? lightFontColor
                              : darkFontColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenDrawer extends StatefulWidget {
  @override
  _HomeScreenDrawerState createState() => _HomeScreenDrawerState();
}

class _HomeScreenDrawerState extends State<HomeScreenDrawer> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: CustomDrawerScreen(),
      mainScreen: HomeScreen(),
      borderRadius: 24.0,
      angle: 0.0,
      openCurve: Curves.easeIn,
      closeCurve: Curves.easeInBack,
      slideWidth: MediaQuery.of(context).size.width * .5,
    );
  }
}
