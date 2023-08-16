import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:outmap/features/outmap/presentation/provider/provider.dart';

class MapView extends ConsumerWidget {
  const MapView({
    required this.lastKnowLocation,
    required this.polylines,
    super.key,
  });

  final LatLng lastKnowLocation;
  final Set<Polyline> polylines;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CameraPosition initialCameraPosition = CameraPosition(
      target: lastKnowLocation,
      zoom: 15,
    );
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        onPointerMove: (_) =>
            ref.read(outMapProvider.notifier).stopFollowingUser(),
        child: GoogleMap(
          polylines: polylines,
          initialCameraPosition: initialCameraPosition,
          compassEnabled: false,
          mapType: MapType.normal,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          onMapCreated: (controller) =>
              ref.read(outMapProvider.notifier).handleInitMap(controller),
        ),
      ),
    );
  }
}
