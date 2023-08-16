part of com.feature.outmap.presentation.screen;

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  late OutMapLocationNotifier outMapLocation;

  @override
  void initState() {
    super.initState();

    outMapLocation = ref.read(outMapLocationProvider.notifier);
    outMapLocation.startFollowingUser();
  }

  @override
  void dispose() {
    outMapLocation.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OutMapLocationState outLocation = ref.watch(outMapLocationProvider);
    OutMapState outMap = ref.watch(outMapProvider);

    return Scaffold(
      body: outLocation.lastKnowLocation == null
          ? const Center(
              child: Text('Espere por favor... '),
            )
          : _Map(outLocation: outLocation, outMap: outMap),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _ButtonsOptions(outLocation: outLocation),
    );
  }
}

class _Map extends StatelessWidget {
  const _Map({required this.outLocation, required this.outMap});

  final OutMapLocationState outLocation;
  final OutMapState outMap;

  @override
  Widget build(BuildContext context) {
    // TextEditingController controller = TextEditingController();
    Map<String, Polyline> polylines =
        Map<String, Polyline>.from(outMap.polylines);
    if (!outMap.showMyRoute) {
      polylines.removeWhere((key, value) => key == 'myRoute');
    }

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          MapView(
            lastKnowLocation: outLocation.lastKnowLocation!,
            polylines: polylines.values.toSet(),
          ),
          const SearchMap(),
          // Positioned(
          //   top: 50,
          //   left: 20,
          //   child: CustomTextFormField(controller: controller),
          // ),
        ],
      ),
    );
  }
}

class _ButtonsOptions extends ConsumerWidget {
  const _ButtonsOptions({
    required this.outLocation,
  });

  final OutMapLocationState outLocation;

  void handleCenterView(
    BuildContext context,
    OutMapLocationState outLocation,
    WidgetRef ref,
  ) {
    if (outLocation.lastKnowLocation == null) {
      final snack = customSnackbar(message: 'No hay ubicación');
      ScaffoldMessenger.of(context).showSnackBar(snack);
      return;
    }
    ref.read(outMapProvider.notifier).moveCamera(outLocation.lastKnowLocation!);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OutMapState outMapState = ref.watch(outMapProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        BtnCurrentMap(
          icon: Icons.more_horiz_rounded,
          onPress: () => ref.read(outMapProvider.notifier).toggleUserRoute(),
        ),
        BtnCurrentMap(
          icon: outMapState.isFollowingUser
              ? Icons.directions_run_rounded
              : Icons.hail_rounded,
          onPress: () => ref.read(outMapProvider.notifier).startFollowingUser(),
        ),
        BtnCurrentMap(
          icon: Icons.my_location_outlined,
          onPress: () => handleCenterView(context, outLocation, ref),
        ),
      ],
    );
  }
}
