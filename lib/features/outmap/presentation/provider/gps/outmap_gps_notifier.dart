part of com.feature.outmap.presentation.provder.gps;

class OutMapGpsNotifier extends StateNotifier<OutMapGpsState> {
  OutMapGpsNotifier()
      : super(const OutMapGpsState(
          isGpsEnabled: false,
          isGpsPermissionGranted: false,
        )) {
    _init();
  }

  StreamSubscription? gpsServiceSubscription;

  Future<void> _init() async {
    final gpsInitStatus = await Future.wait([
      checkGopsStatus(),
      _isPermissionGranted(),
    ]);

    state = state.copyWith(
      isGpsEnabled: gpsInitStatus[0],
      isGpsPermissionGranted: gpsInitStatus[1],
    );
  }

  Future<bool> checkGopsStatus() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();

    gpsServiceSubscription =
        Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = (event.index == 1);
      state = state.copyWith(isGpsEnabled: isEnabled);
    });

    return isEnabled;
  }

  Future<void> askGpsAccess() async {
    final permissionStatus = await Permission.location.request();

    switch (permissionStatus) {
      case PermissionStatus.granted:
        state = state.copyWith(isGpsPermissionGranted: true);
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.provisional:
        state = state.copyWith(isGpsPermissionGranted: false);
        openAppSettings();
        break;
    }
  }

  Future<bool> _isPermissionGranted() async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  @override
  void dispose() {
    gpsServiceSubscription?.cancel();
    super.dispose();
  }
}
