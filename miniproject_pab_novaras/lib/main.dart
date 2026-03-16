import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'controllers/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeCtrl = Get.put(ThemeController());

    return Obx(() => GetMaterialApp(
      title: 'Daily Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'serif',
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1A1A2E),
          secondary: Color(0xFFE07A5F),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F0EB),
        cardColor: Colors.white,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'serif',
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE07A5F),
          secondary: Color(0xFFE07A5F),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
      ),
      themeMode: themeCtrl.isDark.value ? ThemeMode.dark : ThemeMode.light,
      home: supabase.auth.currentSession != null
          ? const HomeScreen()
          : const LoginScreen(),
    ));
  }
}