import 'package:dev_bank/app_routes.dart';
import 'package:dev_bank/core/binding/binding.dart';
import 'package:dev_bank/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Dev Bank',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.terminalBG,
          colorScheme: ColorScheme.light(
            surface: AppColors.terminalBG,
            primary: AppColors.terminalBG,
          ),
          canvasColor: AppColors.terminalBG,
          fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
          useMaterial3: true,
        ),
        initialBinding: Binding(),
        getPages: AppRoutes.routes,
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}
