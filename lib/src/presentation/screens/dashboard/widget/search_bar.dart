import 'package:ecommerce/src/app_config/imports/import.dart';

Widget buildSearchBar({
  required TextEditingController controller,
  required ValueChanged<String> onChanged,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 12.w),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Search Anything...",
          border: InputBorder.none,
          icon: Icon(Icons.search, color: AppColors.grayColor),
        ),
        onChanged: onChanged,
      ),
    ),
  );
}