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
  MapboxMapController? _mapController;

  void handleInitMap(MapboxMapController controller) {
    _mapController = controller;
    // _mapController!.setMapStyle(jsonEncode(styleMap));
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
    const myRoute = LineOptions(geometry: [
      LatLng(-33.86711, 151.1947171),
      LatLng(-33.86711, 151.1947171),
      LatLng(-32.86711, 151.1947171),
      LatLng(-33.86711, 152.1947171),
    ], lineColor: "#ff0000", lineWidth: 14.0, lineOpacity: 0.5, draggable: true
        // polylineId: const PolylineId('myRoute'),
        // color: Colors.black,
        // width: 5,
        // startCap: Cap.roundCap,
        // endCap: Cap.roundCap,
        // points: userLocation,
        );

    final currentPolylines = Map<String, LineOptions>.from(state.polylines);
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
