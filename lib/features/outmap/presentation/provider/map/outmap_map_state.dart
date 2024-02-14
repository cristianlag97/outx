part of 'map.dart';

class OutMapState extends Equatable {
  const OutMapState({
    this.isFollowingUser = true,
    this.isMapInitialized = false,
    this.showMyRoute = true,
    Map<String, LineOptions>? polylines,
  }) : polylines = polylines ?? const {};

  final bool isMapInitialized, isFollowingUser, showMyRoute;
  final Map<String, LineOptions> polylines;

  OutMapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingUser,
    bool? showMyRoute,
    Map<String, LineOptions>? polylines,
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
