import 'package:ecommerce/src/app_config/imports/import.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  AppEnvironment.setupEnv(Environment.DEVELOPMENT);
  initDependencies();
  await HiveManager.initHive();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppEnvironment.statusBarColor,
    statusBarIconBrightness: AppEnvironment.statusBarIconColor,
  ));
  ErrorWidget.builder = (FlutterErrorDetails details)=>SafeArea(child: Scaffold(
    appBar: CustomAppBar(appBarTitleText: AppEnvironment.title),
    body: CustomErrorWidget(errorMessage: details.exceptionAsString()),
  ));
  runApp(const MyApp());
}
