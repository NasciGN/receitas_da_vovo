import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:receitas_da_vovo/views/filterPage.dart';
import 'package:receitas_da_vovo/views/homeScreen.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(DevicePreview(
        enabled: true,
        builder: (context) => MaterialApp(
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              initialRoute: '/home',
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case '/home':
                    return MaterialPageRoute(
                        builder: (context) => const HomeScreen());
                  case '/filterRecipe':
                    final String recipesType = settings.arguments as String;
                    return MaterialPageRoute(
                        builder: (context) => FilterRecipesPage(
                              recipesType: recipesType,
                            ));
                }
              },
            )));
  });
}
