import 'package:ecommerce/src/app_config/imports/import.dart';

class DashboardEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class DashboardGetProductInformation extends DashboardEvent{}

class DashboardSearchQueryChanged extends DashboardEvent {
  final String query;
  DashboardSearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}