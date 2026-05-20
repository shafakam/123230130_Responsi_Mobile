import 'package:responsi/models/fav_models.dart';
import 'package:responsi/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'routes/app_routes.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Wajib kalau ada async di main

  // Init Hive
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteModelAdapter()); // dari fav_models.g.dart
  await Hive.openBox<FavoriteModel>('favBox');

  // Cek login status
  bool isUserLoggedIn = await AuthService.isLoggedIn();

  runApp(MyApp(isLoggedIn: isUserLoggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Keripikroll',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: isLoggedIn ? Routes.main : Routes.login,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}

//Hive.initFlutter() → registerAdapter → openBox
