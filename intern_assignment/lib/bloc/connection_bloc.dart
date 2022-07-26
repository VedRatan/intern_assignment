import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityBloc {
  late StreamController _connectivityController;
  StreamSink get connectivityResultSink =>
      _connectivityController.sink;
  Stream get connectivityResultStream =>
      _connectivityController.stream;

  ConnectivityBloc() {
   _connectivityController = StreamController<ConnectivityResult>.broadcast();
    checkCurrentConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityController.add(result);
    });
  }
  void checkCurrentConnectivity() async {
    ConnectivityResult connectivityResult =
    await Connectivity().checkConnectivity();
    _connectivityController.add(connectivityResult);
  }

  dispose() {
    _connectivityController?.close();
  }
}