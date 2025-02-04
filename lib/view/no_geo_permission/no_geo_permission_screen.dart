import 'package:flutter/material.dart';

import '../../model/time_of_day.dart';

class NoGeoPermissionScreen extends StatelessWidget {
  const NoGeoPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: TimeOfDayEnum.getCurrentTimeDay(DateTime.now().hour).color,
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "No geo permission. Give permission in app settings.",
                  style: TextStyle(color: Colors.white, fontSize: 18,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
