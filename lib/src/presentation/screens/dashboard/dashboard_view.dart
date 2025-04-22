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
        buildSearchBar(),
        SizedBox(height: 12.h),
        buildProductsList(state),
      ],
    );
  }
}