import 'package:flutter/cupertino.dart';
import 'package:ibmi_app/pages/bmi_page.dart';
import 'package:ibmi_app/pages/history.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> tabs = [
    const BMIPage(),
    HistoryPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        // backgroundColor: Color.fromARGB(255, 236, 234, 234),
        // border: Border.symmetric(
        //     horizontal: BorderSide(color: Color.fromARGB(255, 211, 206, 206))),
        middle: Text(
          "IMBI",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "BMI",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "History",
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) => tabs[index],
          );
        },
      ),
    );
  }
}
