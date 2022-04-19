import 'package:dzikr_app/core/config/theme_config.dart';
import 'package:dzikr_app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Dzikir App',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      home: const HomePage(),
    ),
  );
}
