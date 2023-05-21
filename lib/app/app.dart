// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dev/Resources/Theme/theme_data.dart';
import 'package:flutter_dev/Resources/colors_manager.dart';
import 'package:flutter_dev/Resources/routes_manager.dart';
import 'package:flutter_dev/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  getCurrentAppTheme() {
    // print(themeChangeProvider.themeMode);
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<ThemeProvider>(context).addListener(() => setState(() {}));
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          // statusBarColor: Color(0xffED9728),
          statusBarBrightness: Brightness.dark),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => themeChangeProvider,
        )
      ],
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, value, _) {
          return MaterialApp(
            theme: getApplicationtheme(themeChangeProvider.isDark),
            // darkTheme: getDarkTheme(),
            // themeMode: themeChangeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashRoute,
          );
        },
      ),
    );
  }
}
