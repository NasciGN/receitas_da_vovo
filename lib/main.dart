import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/views/detailPage.dart';
import 'package:receitas_da_vovo/views/homeScreen.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            initialRoute: '/home',
            routes: {
              '/home': (_) => const HomeScreen(),
              '/detail': (_) => const DetailPage(),
            },
          )));
}
