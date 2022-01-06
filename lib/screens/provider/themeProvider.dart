import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  int themeValue = 0;
  /*
    0 => Light theme
    1 => Dark theme
  */

  Future<void> getCurrentTheme() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final int val = pref.getInt("theme");
    if (val == null) {
      pref.setInt("theme", 0);
      debugPrint("setting shared preference -> theme = 0");
    } else {
      if (val == 1) {
        themeValue = 1;
        debugPrint(
            "the value is already present in theme provider so returning 1");
      } else {
        themeValue = 0;
        debugPrint(
            "the value is already present in theme provider so returning 0");
      }
    }
    notifyListeners();
  }

  Future<void> changeThemeToDark() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("theme", 1);
    themeValue = 1;
    debugPrint("changing theme to dark ${pref.getInt("theme")}");
    notifyListeners();
  }

  Future<void> changeThemeToLight() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("theme", 0);
    themeValue = 0;
    debugPrint("changing theme to light ${pref.getInt("theme")}");
    notifyListeners();
  }
}
