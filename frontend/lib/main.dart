import 'package:flutter/material.dart';
import 'package:petzone_project/providers/auth_provider.dart';
import 'package:petzone_project/providers/home_provider.dart'; // عدلت هنا الاسم
import 'package:provider/provider.dart';
import 'routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'utils/app_theme.dart' show AppTheme;
import 'viewmodels/home_view_model.dart' show PetsViewModel;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Test',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
