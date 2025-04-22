import 'package:ecommerce/src/app_config/imports/import.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._productsInformation) : super(DashboardInitial()) {
    on<DashboardGetProductInformation>(_onGetBangladeshInformation);
  }


  final ProductsInformation _productsInformation;

  void _onGetBangladeshInformation(DashboardGetProductInformation event, Emitter<DashboardState> emit)async{
    emit(DashboardLoading());
    final response = await _productsInformation(NoParams());
    response.fold(
          (failure) => emit(DashboardError("Data not found")),
          (success) => emit(DashboardLoaded(success)),
    );
  }
}
