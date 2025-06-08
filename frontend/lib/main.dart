import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petzone_project/utils/app_theme.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';
import 'providers/auth_provider.dart';
import 'providers/user_notification_provider.dart';
import 'providers/doctor_provider.dart';
import 'providers/favorite_provider.dart';
import 'providers/sale_details_provider.dart';
import 'providers/adopt_pet_provider.dart';
import 'providers/home_provider.dart';

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
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserNotificationProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => SalePetProvider()),
        ChangeNotifierProvider(create: (_) => AdoptPetProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()), // <-- ADD THIS LINE
      ],
      child: MaterialApp(
        title: 'Test',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}