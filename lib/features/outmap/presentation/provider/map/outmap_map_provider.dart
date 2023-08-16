part of com.feature.outmap.presentation.provder.map;

final outMapProvider = StateNotifierProvider<OutMapNotifier, OutMapState>(
  (ref) {
    final outMapLocationNotifier = ref.read(outMapLocationProvider.notifier);
    return OutMapNotifier(outMapLocationNotifier);
  },
);
