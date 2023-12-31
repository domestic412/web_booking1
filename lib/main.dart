import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web_booking/resources/localization_service.dart';
import 'package:web_booking/widgets/horizontal_scroll.dart';

import 'utils/getx_route.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  await GetStorage.init();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HAI AN Service',
      // theme: ThemeData(
      // textTheme:
      //     GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      // textButtonTheme: TextButtonThemeData(
      //     style: TextButton.styleFrom(primary: Colors.blueGrey)),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ButtonStyle(
      //         backgroundColor:
      //             MaterialStateProperty.all<Color>(Color(0xFF3D45EE)))),
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      // ),
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomHorizontalScroll(),
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      translations: Languages(),
      locale: Locale('vi', 'VN'),
      fallbackLocale: Locale('en', 'US'),
      getPages: GetRoutes.router,
      // initialRoute: ,
    );
  }
}
