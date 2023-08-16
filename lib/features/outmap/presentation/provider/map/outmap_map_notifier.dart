part of com.feature.outmap.presentation.provder.map;

class OutMapNotifier extends StateNotifier<OutMapState> {
  OutMapNotifier(this.outMapLocationNotifier) : super(const OutMapState()) {
    locationStateSuscription =
        outMapLocationNotifier.stream.listen((locationState) {
      if (locationState.lastKnowLocation != null) {
        _polylinesNewPoint(locationState.myLocationHistory);
      }

      if (!state.isFollowingUser) return;
      if (locationState.lastKnowLocation == null) return;
      moveCamera(locationState.lastKnowLocation!);
    });
  }

  final OutMapLocationNotifier outMapLocationNotifier;

  StreamSubscription<OutMapLocationState>? locationStateSuscription;
  GoogleMapController? _mapController;

  void handleInitMap(GoogleMapController controller) {
    _mapController = controller;
    _mapController!.setMapStyle(jsonEncode(styleMap));
    state = state.copyWith(isMapInitialized: true);
  }

  void moveCamera(LatLng myLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(myLocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  void startFollowingUser() {
    state = state.copyWith(
      isFollowingUser: true,
    );
    if (outMapLocationNotifier.state.lastKnowLocation == null) return;
    moveCamera(outMapLocationNotifier.state.lastKnowLocation!);
  }

  void _polylinesNewPoint(List<LatLng> userLocation) {
    final myRoute = Polyline(
      polylineId: const PolylineId('myRoute'),
      color: Colors.black,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      points: userLocation,
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['myRoute'] = myRoute;
    state = state.copyWith(polylines: currentPolylines);
  }

  void toggleUserRoute() {
    state = state.copyWith(showMyRoute: !state.showMyRoute);
  }

  void stopFollowingUser() {
    state = state.copyWith(
      isFollowingUser: false,
    );
  }

  @override
  void dispose() {
    locationStateSuscription?.cancel();
    super.dispose();
  }
}
