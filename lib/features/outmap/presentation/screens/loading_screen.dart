part of com.feature.outmap.presentation.screen;

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isAllGreat = ref.watch(outMapGpsProvider).isAllGreat;
    return Scaffold(
      body: isAllGreat ? const MapScreen() : const GpsAccessAcreen(),
    );
  }
}
