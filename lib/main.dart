import 'package:flutter/material.dart';
import 'package:weather_cast/router/router.dart';

import 'di/di_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencies().setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather cast',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
