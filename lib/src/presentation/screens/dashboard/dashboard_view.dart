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


  Widget _blocBuilder(context, state) {
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
    } /*else if (state is DashboardLoaded) {
      final info = state.productInfo.title;
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //const SizedBox(height: 50),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: info.length,
                itemBuilder: (BuildContext context, int index) {
                  final record = info[index];  // Individual record
                  final fields = record.fields;   // Access fields of the individual record
                  return Column(
                    children: [
                      InkWell(
                        onTap: ()=> NavigationHelper.goToPlaceDetails(context, arguments: fields),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 310,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                                width: MediaQuery.of(context).size.width,
                                height: 170,
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                    child: CachedNetworkImage(
                                      imageUrl: fields?.image ?? '',
                                      placeholder: (context, url) => Center(child: SizedBox(
                                          width:30,
                                          height:30,
                                          child: CircularProgressIndicator())),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                              Positioned(
                                right:10,
                                top: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: LightColors.primaryColor,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  padding: EdgeInsets.all(5),
                                  child: Center(child: Text(fields?.country ?? 'N/A',style: TextStyle(color: Colors.white,fontSize: 12))),
                                ),
                              ),
                              Positioned(
                                top: 180,
                                left: 10,
                                right:10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(fields?.title ?? 'No Title',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                    SizedBox(height: 10,),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(fields?.description ?? 'No Description',
                                        maxLines: 4, // Limit to 4 lines
                                        overflow: TextOverflow.ellipsis, // Show ellipsis if overflow
                                      ),
                                    ),
                                  ],
                                ),
                              )
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
    }*/

    return const SizedBox();
  }

}