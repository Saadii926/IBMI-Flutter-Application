import 'package:flutter/cupertino.dart';
import 'package:ibmi_app/widget/info_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HistoryPage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;
  HistoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: _dataCard(),
    );
  }

  Widget _dataCard() {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final prefs = snapshot.data as SharedPreferences;
          final date = prefs.getString("bmi_date");
          final bmidata = prefs.getStringList("bmi_data");
          return Center(
            child: InfoCard(
              width: _deviceWidth! * 0.75,
              height: _deviceHeight! * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _statusText(bmidata![1]),
                  _dateText(date.toString()),
                  _bmiText(bmidata[0]),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CupertinoActivityIndicator(
              color: CupertinoColors.activeBlue,
            ),
          );
        }
      },
    );
  }

  Widget _statusText(String status) {
    return Text(
      status,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _dateText(String date) {
    DateTime parseDate = DateTime.parse(date);
    return Text(
      "${parseDate.day} / ${parseDate.month} / ${parseDate.year}",
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _bmiText(String bmi) {
    return Text(
      bmi,
      style: const TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
