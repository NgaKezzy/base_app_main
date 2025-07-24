import 'package:alice/alice.dart';
import 'package:baseApp/core/di/di.dart';
import 'package:baseApp/generated/l10n.dart';
import 'package:baseApp/routers/app_router.dart';
import 'package:baseApp/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:toastification/toastification.dart';

enum BuildFlavor { dev, staging, production }

BuildFlavor appFlavor = BuildFlavor.dev;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appFlavor = BuildFlavor.dev;

  await dotenv.load(fileName: '.env');

  // Đăng ký baseUrl trước khi configureDependencies
  final baseUrl = appFlavor == BuildFlavor.production
      ? dotenv.env['BASE_URL_PROD'] ?? 'https://jsonplaceholder.typicode.com'
      : dotenv.env['BASE_URL_DEV'] ?? 'https://jsonplaceholder.typicode.com';

  getIt.registerSingleton<String>(baseUrl);

  await configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ScreenUtilInit(
        designSize: const Size(375, 812), // Kích thước design của bạn
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('vi'),
            ],
            locale: const Locale('en'),
            routerConfig: AppRoutes().router,
          );
        },
      ),
    );
  }
}
