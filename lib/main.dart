import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'consts/app_colors.dart';
import 'provider/bmi_provider.dart';
import 'view/page/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BMIProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: AppColors.kBackgroundColor,
        ),
        scaffoldBackgroundColor: AppColors.kBackgroundColor,
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}
