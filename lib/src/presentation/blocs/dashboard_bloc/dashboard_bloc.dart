import 'package:ecommerce/src/app_config/imports/import.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._productsInformation) : super(DashboardInitial()) {
    on<DashboardGetProductInformation>(_onGetBangladeshInformation);
    on<DashboardSearchQueryChanged>(_onSearchProduct);
  }

  final ProductsInformation _productsInformation;
  final List<Product> _allProducts = [];

  void _onGetBangladeshInformation(DashboardGetProductInformation event, Emitter<DashboardState> emit)async{
    emit(DashboardLoading());
    final response = await _productsInformation(NoParams());
    response.fold(
          (failure) => emit(DashboardError("Data not found")),
          (success) {
          _allProducts.clear();
          _allProducts.addAll(success);
          emit(DashboardLoaded(success));
        },
    );
  }

  void _onSearchProduct(DashboardSearchQueryChanged event, Emitter<DashboardState> emit)async{
    final filteredProducts = _allProducts.where((product) {
      return product.title.toLowerCase().contains(event.query.toLowerCase());
    }).toList();

    emit(DashboardLoaded(filteredProducts, searchQuery: event.query));
  }


}
