import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dev/Resources/assets_manager.dart';
import 'package:flutter_dev/Resources/colors_manager.dart';
import 'package:flutter_dev/Resources/routes_manager.dart';

// import 'package:flutter_dev/presentation/Resources/values_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() {
    _timer = Timer(const Duration(seconds: 4), _onDoneLoading);
  }

  _onDoneLoading() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.PrimaryColor,
      body: Center(
        child: Image.asset(AssetsManager.SplashLogo),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
