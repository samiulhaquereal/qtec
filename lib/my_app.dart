import 'package:ecommerce/src/app_config/imports/import.dart';
import 'package:upgrader/upgrader.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      child: UpgradeAlert(
        barrierDismissible: false,
        showIgnore: false,
        showLater: false,
        showReleaseNotes: false,
        upgrader: Upgrader(),
        child: SafeArea(
          child: MultiBlocProvider(
            providers: [],
            child: MaterialApp.router(
              title: AppEnvironment.title,
              debugShowCheckedModeBanner: AppEnvironment.debugBanner,
              theme: ThemeData(
                primaryColor: AppColors.primaryColor,
                colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
                useMaterial3: true,
              ),
              routerConfig: AppRouter.router, // Integrate GoRouter
            ),
          )
        ),
      ),
    );
  }
}
