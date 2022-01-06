import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tack_habit/screens/provider/themeProvider.dart';
import 'package:tack_habit/screens/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      ),
    ], child: MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      // * As I am hoping to add authentication in the upcoming version of the
      // * And I do not want to upload any sensitive credential on github
      // * So I will not be adding auth on open source project
      home: Wrapper(),
    );
  }
}
