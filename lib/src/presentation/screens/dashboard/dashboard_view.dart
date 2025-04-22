import 'dart:developer';
import 'package:ecommerce/src/app_config/imports/import.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DashboardBloc, DashboardState>(
        listener: _blocListener,
        builder: _blocBuilder,
      ),
    );
  }

  Widget _blocListener(context, state) {
    return const SizedBox();
  }


  Widget _blocBuilder(BuildContext context, state) {
    if (state is DashboardInitial) {
      Future.microtask(() {
        context.read<DashboardBloc>().add(DashboardGetProductInformation());
      });
    } else if (state is DashboardLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is DashboardError) {
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
    } else if (state is DashboardLoaded) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: state.productInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  final info = state.productInfo[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: MediaQuery.of(context).size.width.w,
                          height: 310.h,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width.w,
                                height: 170.h,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
                                    child: CachedNetworkImage(
                                      imageUrl: info.image,
                                      placeholder: (context, url) => Center(child: SizedBox(
                                          width:30.w,
                                          height:30.h,
                                          child: CircularProgressIndicator())),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }

}