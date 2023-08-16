part of com.feature.outmap.presentation.screen;

class GpsAccessAcreen extends ConsumerWidget {
  const GpsAccessAcreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OutMapGpsState outMapGpsState = ref.watch(outMapGpsProvider);
    return Scaffold(
      body: Center(
        child: outMapGpsState.isGpsEnabled
            ? const _AccessButton()
            : const _EnabledGpsMessage(),
      ),
    );
  }
}

class _AccessButton extends ConsumerWidget {
  const _AccessButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Es necesario el acceso al Gps'),
          FilledButton(
            onPressed: () {
              ref.read(outMapGpsProvider.notifier).askGpsAccess();
            },
            child: const Text(
              'Solicitar acceso',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
}

class _EnabledGpsMessage extends StatelessWidget {
  const _EnabledGpsMessage();

  @override
  Widget build(BuildContext context) => const Text(
        'Debe de habilitar el GPS',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
      );
}
