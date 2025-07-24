import 'package:baseApp/core/di/di.dart';
import 'package:baseApp/features/home/presentation/cubit/home_cubit.dart';
import 'package:baseApp/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouteName {
  AppRouteName._();

  static const String initial = '/';
  static const String register = '/register';
  static const String homePage = '/home-page';

  // Nested Key
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}

class AppRoutes {
  static final AppRoutes _singleton = AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal();

  /// Khai báo các màn hình mới tại đây
  GoRouter router = GoRouter(
    initialLocation: AppRouteName.initial,
    navigatorKey: AppRouteName.navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouteName.initial,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider.value(
            value: getIt.get<HomeCubit>(),
            child: const HomePage(),
          );
        },
      ),
    ],
  );
}
