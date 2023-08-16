part of com.feature.outmap.presentation.provder.location;

class OutMapLocationState extends Equatable {
  const OutMapLocationState({
    this.followingUser = false,
    this.lastKnowLocation,
    myLocationHistory, //*igual lo recibo por acá
  }) : myLocationHistory = myLocationHistory ??
            const []; //*si no lo recibo como argumento lo inicializo acá como vacio

  final bool followingUser;
  final LatLng? lastKnowLocation;
  final List<LatLng> myLocationHistory; //* siempre va a tener un valor

  OutMapLocationState copyWith({
    bool? followingUser,
    LatLng? lastKnowLocation,
    List<LatLng>? myLocationHistory,
  }) =>
      OutMapLocationState(
        followingUser: followingUser ?? this.followingUser,
        lastKnowLocation: lastKnowLocation ?? this.lastKnowLocation,
        myLocationHistory: myLocationHistory ?? this.myLocationHistory,
      );

  @override
  List<Object?> get props => [
        followingUser,
        lastKnowLocation,
        myLocationHistory,
      ];
}
