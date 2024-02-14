part of features.auth.presentation.screens;

class HeadQuartersConfigurarionScreen extends StatefulWidget {
  const HeadQuartersConfigurarionScreen({super.key});

  @override
  State<HeadQuartersConfigurarionScreen> createState() =>
      _HeadQuartersConfigurarionScreenState();
}

class _HeadQuartersConfigurarionScreenState
    extends State<HeadQuartersConfigurarionScreen> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Text('Configura tu sede', style: textStyle.titleMedium),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              CustomDropDownButton(
                label: 'Categoría',
                dropdownItems: const ['Categoría1', 'Categoría2', 'Categoría3'],
                onChanged: (value) {
                  print('===> $value');
                },
              ),
              SizedBox(height: size.height * 0.02),
              CustomDropDownButton(
                label: 'Subcategoría',
                dropdownItems: const [
                  'Subcategoría1',
                  'Subcategoría2',
                  'Subcategoría3'
                ],
                onChanged: (value) {
                  print('===> $value');
                },
              ),
              SizedBox(height: size.height * 0.02),
              CustomDropDownButton(
                label: 'Departamentos',
                dropdownItems: const [
                  'Departamentos1',
                  'Departamentos2',
                  'Departamentos3'
                ],
                onChanged: (value) {
                  print('===> $value');
                },
              ),
              SizedBox(height: size.height * 0.02),
              CustomDropDownButton(
                label: 'Ciudades',
                dropdownItems: const ['Ciudades1', 'Ciudades2', 'Ciudades3'],
                onChanged: (value) {
                  print('===> $value');
                },
              ),
              SizedBox(height: size.height * 0.02),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                hint: 'Dirección',
                onChanged: (value) {},
                // errorMessage: '',
                //  registerform.isFormPosted
                //     ? registerform.email.errorMessage
                //     : null,
                // prefixIcon: const Icon(
                //   FontAwesomeIcons.envelope,
                //   color: Color(0xFF747688),
                // ),
              ),
              SizedBox(height: size.height * 0.02),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                hint: 'Código postal',
                onChanged: (value) {},
                // errorMessage: '',
                //  registerform.isFormPosted
                //     ? registerform.email.errorMessage
                //     : null,
                // prefixIcon: const Icon(
                //   FontAwesomeIcons.envelope,
                //   color: Color(0xFF747688),
                // ),
              ),

              // const TextInput(label: 'Dirección'),
              // const TextInput(label: 'Código Postal'),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                  height: 400,
                  child: MapboxMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(2.955321259245773, -75.2833333081813),
                      zoom: 15,
                    ),
                    accessToken:
                        "pk.eyJ1IjoiY3Jpc3RpYW5kbGFnOTciLCJhIjoiY2xzbDEzN2s0MDg2MzJrbzlyanRxbmtqeSJ9.YZEvfVlZnSKCEVC17xxVPQ",
                  )
                  // GoogleMap(
                  //   initialCameraPosition: CameraPosition(
                  //     target: LatLng(2.955321259245773, -75.2833333081813),
                  //     zoom: 15,
                  //   ),
                  //   markers: <Marker>{},
                  // ),
                  ),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownInput extends StatelessWidget {
  final String label;

  const DropdownInput({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE4DFDF)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration.collapsed(hintText: label),
        items: const [
          DropdownMenuItem(
            value: 'categoria',
            child: Text('categoria'),
          ),
          DropdownMenuItem(
            value: 'categoria',
            child: Text('categoria'),
          ),
          DropdownMenuItem(
            value: 'categoria',
            child: Text('categoria'),
          )
        ], // Aquí deberías definir los elementos del dropdown
        onChanged: (value) {},
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  final String label;

  const TextInput({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE4DFDF)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        decoration: InputDecoration.collapsed(hintText: label),
      ),
    );
  }
}
