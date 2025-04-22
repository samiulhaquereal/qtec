import 'package:ecommerce/src/app_config/imports/import.dart';

class DashboardState extends Equatable{
  @override

  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  DashboardLoaded(this.productInfo);
  final Product productInfo;

  @override
  List<Object?> get props => [productInfo];
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);

  @override
  List<Object?> get props => [message];
}