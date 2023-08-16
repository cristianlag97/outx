part of com.feature.outmap.presentation.provder.gps;

final outMapGpsProvider =
    StateNotifierProvider<OutMapGpsNotifier, OutMapGpsState>(
  (ref) => OutMapGpsNotifier(),
);
