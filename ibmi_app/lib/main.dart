import 'package:flutter/cupertino.dart';
import 'package:ibmi_app/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      color: CupertinoColors.activeBlue,
      title: "IBMI",
      routes: {
        "/": (BuildContext context) => const MainPage(),
      },
      initialRoute: "/",
    );
  }
}
