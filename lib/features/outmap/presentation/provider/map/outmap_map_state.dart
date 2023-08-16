part of com.feature.outmap.presentation.provder.map;

class OutMapState extends Equatable {
  const OutMapState({
    this.isFollowingUser = true,
    this.isMapInitialized = false,
    this.showMyRoute = true,
    Map<String, Polyline>? polylines,
  }) : polylines = polylines ?? const {};

  final bool isMapInitialized, isFollowingUser, showMyRoute;
  final Map<String, Polyline> polylines;

  OutMapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingUser,
    bool? showMyRoute,
    Map<String, Polyline>? polylines,
  }) =>
      OutMapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        showMyRoute: showMyRoute ?? this.showMyRoute,
        polylines: polylines ?? this.polylines,
      );

  @override
  List<Object?> get props => [isFollowingUser, isMapInitialized, polylines];
}
