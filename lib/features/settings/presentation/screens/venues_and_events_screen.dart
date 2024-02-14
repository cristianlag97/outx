part of 'screen.dart';

class VenuesAndEventsScreen extends StatelessWidget {
  const VenuesAndEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _Header(size: size),
            const _SelectedView(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomFilledButton(
                text: 'CREAR',
                icon: Icons.arrow_forward_outlined,
                buttonColor: Colors.colorSeed,
                onPressed: () {
                  context.push(PAGES.registerHeadquarters.screenPath);
                },
                borderRadius: const Radius.circular(12),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class _SelectedView extends ConsumerWidget {
  const _SelectedView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(pageProvider);

    return isSelected == 0
        ? const VenueAndEventsEmpty(
            title: 'Crea tu primera sede',
            message: 'Disfruta los servicios premium',
          )
        : const VenueAndEventsEmpty(
            title: 'Crea tu primer evento',
            message: 'Disfruta los servicios premium',
          );
  }
}

class _Header extends ConsumerWidget {
  const _Header({required this.size});

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: px16,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: CustomTextFormField(
                  label: 'Buscar...',
                  fontSize: size.height * 0.027,
                  isBorderRadius: false,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.colorSeed,
                    size: size.height * 0.04,
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.03),
              const CustomButtomFilter()
            ],
          ),
          ToggleButton(
            width: size.width * 0.8,
            height: 55,
            toggleBackgroundColor: const Color(0xFFF8F8F8),
            toggleColor: (Colors.white),
            activeTextColor: Colors.colorSeed,
            inactiveTextColor: const Color.fromARGB(170, 56, 55, 55),
            leftDescription: 'SEDES',
            rightDescription: ' EVENTOS',
            onLeftToggleActive: () {
              print('left toggle activated');
              ref.watch(pageProvider.notifier).update((state) => state = 0);
            },
            onRightToggleActive: () {
              print('right toggle activated');
              ref.watch(pageProvider.notifier).update((state) => state = 1);
            },
          ),
        ],
      ),
    );
  }
}
