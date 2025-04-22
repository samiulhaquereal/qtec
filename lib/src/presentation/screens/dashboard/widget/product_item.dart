import 'package:ecommerce/src/app_config/imports/import.dart';

Widget buildProductItem(Product info, int index) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
              child: CachedNetworkImage(
                imageUrl: info.image ?? '',
                height: 120.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Positioned(
              top: 6.h,
              right: 6.w,
              child: CircleAvatar(
                backgroundColor: AppColors.whiteColor,
                child: Icon(Icons.favorite_border, color: AppColors.redColor),
              ),
            ),
            if (index == 3)
              Positioned(
                top: 10.h,
                left: 10.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    'Out Of Stock',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    '\$${info.price.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '\$${(info.price * 1.2).toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.grayColor,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '20% OFF',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.redColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.orangeColor, size: 14.sp),
                  SizedBox(width: 2.w),
                  Text(
                    '${info.rating.rate}',
                    style: TextStyle(fontSize: 11.sp),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    '(${info.rating.count })',
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}