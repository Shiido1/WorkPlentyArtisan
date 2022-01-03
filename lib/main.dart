import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

import 'core/di/injector.dart';
import 'core/helper/routes/routes.dart';
import 'core/network/app_config.dart';
import 'views/onboarding/intro/intro_screen.dart';

void main() async {
  await initializeCore(environment: Environment.staging);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () => OverlaySupport.global(
        child: MaterialApp(
          title: 'Artisan',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Color(0xff10375C)),
          routes: Routes.getRoutes,
          home: IntroOneScreen(),
        ),
      ),
    );
  }
}
