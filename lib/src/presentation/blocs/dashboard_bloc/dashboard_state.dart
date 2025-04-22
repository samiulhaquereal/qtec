import 'package:ecommerce/src/app_config/imports/import.dart';

class DashboardState extends Equatable{
  @override

  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  DashboardLoaded(this.productInfo, {this.searchQuery = ''});
  final List<Product> productInfo;
  final String searchQuery;

  DashboardLoaded copyWith({
    List<Product>? productInfo,
    String? searchQuery,
  }) {
    return DashboardLoaded(
      productInfo ?? this.productInfo,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [productInfo,searchQuery];
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);

  @override
  List<Object?> get props => [message];
}