import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'app/bindings/dependency_injection.dart';
import 'app/core/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        debugPrint("Height=========${MediaQuery.of(context).size.height}");
    debugPrint("Weight=========${MediaQuery.of(context).size.width}");
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => GetMaterialApp.router(
        initialBinding: DependencyInjection(),
        debugShowCheckedModeBanner: false,

        //route
        routeInformationParser: AppRouter.route.routeInformationParser,
        routerDelegate: AppRouter.route.routerDelegate,
        routeInformationProvider: AppRouter.route.routeInformationProvider,
      ),
    );
  }
}


