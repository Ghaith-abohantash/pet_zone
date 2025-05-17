import 'package:flutter/material.dart';
import 'package:petzone_project/routes/app_routes.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutess.empty,

      onGenerateRoute: AppRoutess.onGenerateRoute,
    );
  }
}
