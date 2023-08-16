part of com.feature.outmap.presentation.provder.gps;

class OutMapGpsState extends Equatable {
  const OutMapGpsState({
    required this.isGpsEnabled,
    required this.isGpsPermissionGranted,
  });

  final bool isGpsEnabled, isGpsPermissionGranted;

  bool get isAllGreat => isGpsEnabled && isGpsPermissionGranted;

  OutMapGpsState copyWith({
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
  }) =>
      OutMapGpsState(
        isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
        isGpsPermissionGranted:
            isGpsPermissionGranted ?? this.isGpsPermissionGranted,
      );

  @override
  String toString() {
    return '''
    isGpsEnabled: $isGpsEnabled,
    isGpsPermissionGranted: $isGpsPermissionGranted,
    ''';
  }

  @override
  List<Object?> get props => [
        isGpsEnabled,
        isGpsPermissionGranted,
      ];
}
