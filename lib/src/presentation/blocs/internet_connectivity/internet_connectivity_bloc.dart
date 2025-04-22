import 'package:ecommerce/src/app_config/imports/import.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  late final StreamSubscription _connectivitySubscription;

  ConnectivityBloc(this._connectivity) : super(ConnectivityInitial()) {
    on<CheckConnectivityEvent>(_onCheckConnectivity);
    on<ConnectivityChangedEvent>(_onConnectivityChanged);

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_handleConnectivityChange);
  }

  Future<void> _onCheckConnectivity(
      CheckConnectivityEvent event, Emitter<ConnectivityState> emit) async {
    final result = await _connectivity.checkConnectivity();
    add(ConnectivityChangedEvent(result != ConnectivityResult.none));
  }

  void _onConnectivityChanged(
      ConnectivityChangedEvent event, Emitter<ConnectivityState> emit) {
    emit(event.isConnected ? ConnectivityOnline() : ConnectivityOffline());
  }

  void _handleConnectivityChange(List<ConnectivityResult> results) {
    final isConnected = results.any((result) => result != ConnectivityResult.none);
    add(ConnectivityChangedEvent(isConnected));
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}