import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:resume_builder_app/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   const Duration(seconds: 3),
    //   () {
    //     Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
    //   },
    // );

    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        Navigator.of(context).pushReplacementNamed(
          AppRoutes.homePage,
        );
        timer.cancel();
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: kIsWeb
            ? Image.network("lib/assets/gif/splash-image.gif")
            : Image.asset("lib/assets/gif/splash-image.gif"),
      ),
    );
  }
}
