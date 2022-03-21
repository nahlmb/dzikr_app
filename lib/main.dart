import 'package:dzikr_app/core/config/theme_config.dart';
import 'package:dzikr_app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ThemeConfig.lightColorScheme,
        textTheme: ThemeConfig.textTheme.apply(
            bodyColor: ThemeConfig.lightColorScheme.onBackground,
            displayColor: ThemeConfig.lightColorScheme.onBackground)),
    darkTheme: ThemeData(
        colorScheme: ThemeConfig.darkColorScheme,
        brightness: Brightness.dark,
        textTheme: ThemeConfig.textTheme.apply(
            bodyColor: ThemeConfig.darkColorScheme.onBackground,
            displayColor: ThemeConfig.darkColorScheme.onBackground)),
    home: const HomePage(),
  ));
}
