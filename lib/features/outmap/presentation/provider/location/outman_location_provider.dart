part of com.feature.outmap.presentation.provder.location;

final outMapLocationProvider =
    StateNotifierProvider<OutMapLocationNotifier, OutMapLocationState>(
  (ref) => OutMapLocationNotifier(),
);
