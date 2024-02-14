part of 'location.dart';

class OutMapLocationNotifier extends StateNotifier<OutMapLocationState> {
  OutMapLocationNotifier() : super(const OutMapLocationState());

  StreamSubscription<Position>? locationStream;

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    state = state.copyWith(
      lastKnowLocation: LatLng(position.latitude, position.longitude),
      myLocationHistory: [
        ...state.myLocationHistory,
        LatLng(position.latitude, position.longitude),
      ],
    );
  }

  void startFollowingUser() {
    locationStream = Geolocator.getPositionStream().listen((event) {
      state = state.copyWith(
        followingUser: true,
        lastKnowLocation: LatLng(event.latitude, event.longitude),
        myLocationHistory: [
          ...state.myLocationHistory,
          LatLng(event.latitude, event.longitude),
        ],
      );
    });
  }

  void stopFollowingUser() {
    locationStream?.cancel();
    state = state.copyWith(followingUser: false);
  }

  @override
  void dispose() {
    stopFollowingUser();
    super.dispose();
  }
}
