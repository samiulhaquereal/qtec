import 'package:ecommerce/src/app_config/imports/import.dart';

void showSortBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sort By',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16.sp)),
                IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.close))
              ],
            ),
            ListTile(
              title: Text('Price: Low to High',style: TextStyle(fontSize: 15.sp)),
              onTap: () {
                context.read<DashboardBloc>().add(
                  DashboardSortOptionChanged(SortOption.priceLowToHigh),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Price: High to Low',style: TextStyle(fontSize: 15.sp)),
              onTap: () {
                context.read<DashboardBloc>().add(
                  DashboardSortOptionChanged(SortOption.priceHighToLow),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Rating',style: TextStyle(fontSize: 15.sp)),
              onTap: () {
                context.read<DashboardBloc>().add(
                  DashboardSortOptionChanged(SortOption.ratingHighToLow),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}