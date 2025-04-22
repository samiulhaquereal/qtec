import 'package:ecommerce/src/app_config/imports/import.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._productsInformation,this._connectivityService) : super(DashboardInitial()) {
    on<DashboardGetProductInformation>(_onGetProductInformation);
    on<DashboardSearchQueryChanged>(_onSearchProduct);
    on<DashboardSortOptionChanged>(_onSortOptionChanged);
  }

  final ProductsInformation _productsInformation;
  final ConnectivityService _connectivityService;
  final List<Product> _allProducts = [];

  void _onGetProductInformation(DashboardGetProductInformation event, Emitter<DashboardState> emit)async{
    final isConnected = await _connectivityService.isConnected();
    print(isConnected);

    if (!isConnected) {
      final cachedProducts = await HiveCache.getData<List<dynamic>>(
        boxName: 'productInformation',
        key: 'product_list',
      );
      if (cachedProducts != null) {
        /*_allProducts.clear();
        List<ProductInformationModel> productInformationModels = cachedProducts.map((data) => ProductInformationModel.fromJson(data)).toList();
        _allProducts.addAll(cachedProducts.cast<Product>());
        emit(DashboardLoaded(_allProducts));*/
      } else {
        emit(DashboardError("No cached data available"));
      }
      return;
    }

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

  void _onSortOptionChanged(DashboardSortOptionChanged event, Emitter<DashboardState> emit) {
    final currentState = state;
    if (currentState is DashboardLoaded) {
      List<Product> sortedProducts = List.from(currentState.productInfo);

      if (event.sortOption == SortOption.priceLowToHigh) {
        sortedProducts.sort((a, b) => a.price.compareTo(b.price));
      } else if (event.sortOption == SortOption.priceHighToLow) {
        sortedProducts.sort((b, a) => a.price.compareTo(b.price));
      } else if (event.sortOption == SortOption.ratingHighToLow) {
        sortedProducts.sort((b, a) => a.rating.rate.compareTo(b.rating.rate));
      }

      emit(currentState.copyWith(productInfo: sortedProducts));
    }
  }


}
