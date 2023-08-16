part of com.feature.outmap.presentation.widgets;

class BtnCurrentMap extends StatelessWidget {
  const BtnCurrentMap({required this.icon, required this.onPress, super.key});
  final IconData icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(onPressed: onPress, icon: Icon(icon)),
      ),
    );
  }
}
