import 'package:ecommerce/src/app_config/imports/import.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.getSplashRoute(),
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: NotFoundScreen(),
    ),
    observers: [StatusBarColorObserver()],
    routes: [
      GoRoute(
        path: Routes.getSplashRoute(),
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.getPageNotFoundRoute(),
        builder: (context, state) => NotFoundScreen(),
      ),
      /*GoRoute(
        path: Routes.getDashboardRoute(),
        builder: (context, state) => const DashboardScreen(),
      ),*/
    ],
  );
}
