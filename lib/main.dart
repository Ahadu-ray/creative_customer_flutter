import 'package:creative_customer_flutter/shared/routes/app_pages.dart';
import 'package:creative_customer_flutter/shared/routes/app_routes.dart';
import 'package:creative_customer_flutter/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: Routes.onboardingPage,
      theme: ThemeData(scaffoldBackgroundColor: AppTheme.scaffoldBg),
    );
  }
}
