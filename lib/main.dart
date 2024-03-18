import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:movieio/common/configs/general.binding.dart';
import 'package:movieio/common/routes/routes.dart';
import 'package:movieio/common/utils/theme/theme.dart';
import 'package:movieio/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movieio',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      enableLog: true,
      themeMode: ThemeMode.system,
      darkTheme: MVAppTheme.darkTheme,
      theme: MVAppTheme.lightTheme,
      initialBinding: GeneralBindings(),
    );
  }
}
