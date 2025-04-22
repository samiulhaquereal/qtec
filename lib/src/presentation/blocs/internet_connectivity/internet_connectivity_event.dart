import 'package:ecommerce/src/app_config/imports/import.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object?> get props => [];
}

class CheckConnectivityEvent extends ConnectivityEvent {}

class ConnectivityChangedEvent extends ConnectivityEvent {
  final bool isConnected;

  const ConnectivityChangedEvent(this.isConnected);

  @override
  List<Object?> get props => [isConnected];
}
