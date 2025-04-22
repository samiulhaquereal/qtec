import 'package:ecommerce/src/app_config/imports/import.dart';

class SnackBarWidget {
  static final SnackBarWidget _instance = SnackBarWidget._internal();
  factory SnackBarWidget() => _instance;
  SnackBarWidget._internal();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void showSnackBar({
    required String message,
    Color backgroundColor = AppColors.blackColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: duration,
    );

    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
