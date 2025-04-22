import 'dart:developer';
import 'package:ecommerce/src/app_config/imports/import.dart';

Widget buildRetryButton(DashboardError state) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          state.message,
          style: TextStyle(color: AppColors.redColor, fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.sp),
        ElevatedButton(
          onPressed: ()=> log('Retry logic'),
          child: const Text("Retry"),
        ),
      ],
    ),
  );
}