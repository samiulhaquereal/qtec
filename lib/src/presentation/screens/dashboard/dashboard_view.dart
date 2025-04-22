import 'package:ecommerce/src/app_config/imports/import.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final TextEditingController searchController = TextEditingController();

  /*@override
  void initState() {
    super.initState();
    serviceLocator<ConnectivityService>().onConnectivityChanged.listen((isConnected) {
      if (!isConnected) {
        serviceLocator<SnackBarWidget>().showSnackBar(message: 'No internet connection',backgroundColor: AppColors.redColor);
      }
    });
  }*/

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
      return buildRetryButton(state);
    } else if (state is DashboardLoaded) {
      return _buildProducts(state)
      ;
    }
    return const SizedBox();
  }

  Widget _buildProducts(DashboardLoaded state) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        DashboardSearchBar(
            controller: searchController,
            onChanged: (value) {
              context.read<DashboardBloc>().add(DashboardSearchQueryChanged(value));
            },
            onSortPressed: ()=> showSortBottomSheet(context),
        ),
        SizedBox(height: 12.h),
        buildProductsList(state),
      ],
    );
  }

}