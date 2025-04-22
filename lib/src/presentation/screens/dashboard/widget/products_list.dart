import 'package:ecommerce/src/app_config/imports/import.dart';

Widget buildProductsList(DashboardLoaded state) {
  return Expanded(
    child: GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 0.65,
      ),
      itemCount: state.productInfo.length,
      itemBuilder: (context, index) {
        final info = state.productInfo[index];
        return buildProductItem(info, index);
      },
    ),
  );
}