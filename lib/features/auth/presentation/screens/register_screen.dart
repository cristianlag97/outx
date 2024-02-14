part of 'screens.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(children: <Widget>[
            const Positioned(
              bottom: 70,
              right: -140,
              child: CustomCircileOpacity(),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        if (!context.canPop()) return;
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back_rounded,
                          color: Colors.black),
                    ),
                  ],
                ),
                const _RegisterForm(),
                const SizedBox(height: 24)
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class _RegisterForm extends ConsumerWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final registerform = ref.watch(registerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 18),
          Row(
            children: [
              Text('Registro', style: textStyle.titleMedium),
            ],
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            keyboardType: TextInputType.text,
            hint: 'Nombre completo',
            onChanged: ref.read(registerProvider.notifier).onFullNameChange,
            errorMessage: registerform.isFormPosted
                ? registerform.fullName.errorMessage
                : null,
            prefixIcon: const Icon(
              FontAwesomeIcons.user,
              color: Color(0xFF747688),
            ),
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            hint: 'Email',
            onChanged: ref.read(registerProvider.notifier).onEmailChange,
            errorMessage: registerform.isFormPosted
                ? registerform.email.errorMessage
                : null,
            prefixIcon: const Icon(
              FontAwesomeIcons.envelope,
              color: Color(0xFF747688),
            ),
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            keyboardType: TextInputType.text,
            onActivateObscureText:
                ref.read(registerProvider.notifier).onChangeObscureText,
            isPassword: true,
            obscureText: registerform.isObscureText,
            hint: 'Contraseña',
            onChanged: ref.read(registerProvider.notifier).onPasswordChanged,
            errorMessage: registerform.isFormPosted
                ? registerform.password.errorMessage
                : null,
            prefixIcon: const Icon(
              Icons.lock_outline_rounded,
              size: 24,
              color: Color(0xFF747688),
            ),
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            keyboardType: TextInputType.text,
            onActivateObscureText:
                ref.read(registerProvider.notifier).onChangeObscureText,
            isPassword: true,
            obscureText: registerform.isObscureText,
            hint: 'Confirmar contraseña',
            onChanged:
                ref.read(registerProvider.notifier).onRepeatPasswordChanged,
            errorMessage: registerform.isFormPosted
                ? registerform.repeatPassword.errorMessage
                : null,
            prefixIcon: const Icon(
              Icons.lock_outline_rounded,
              size: 24,
              color: Color(0xFF747688),
            ),
          ),
          const SizedBox(height: 18),
          CustomDropDownButton(
            dropdownValue: Gender.male.name,
            dropdownItems: genderValues.map.keys.toList(),
            onChanged: (gender) {
              genderValues.map[gender];
            },
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Switch(
                value: registerform.isCompany,
                onChanged: ref.read(registerProvider.notifier).onIsCompany,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              const Text(
                '¿Eres Empresa?',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          if (registerform.isCompany) ...[
            const SizedBox(height: 24),
            FadeInUp(
              duration: const Duration(seconds: 1),
              child: const _RegisterCompanyForm(),
            )
          ],
          const SizedBox(height: 24),
          CustomFilledButton(
            text: 'REGISTRARME',
            left: 50,
            buttonColor: Colors.colorSeed,
            onPressed: () {
              //TODO: Activar cuando hayan servicios
              // ref.read(registerProvider.notifier).onSubmit;
              context.pushReplacement(PAGES.venuesAndEvents.screenPath);
            },
            icon: Icons.arrow_forward_rounded,
          ),
        ],
      ),
    );
  }
}

class _RegisterCompanyForm extends ConsumerWidget {
  const _RegisterCompanyForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerform = ref.watch(registerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          CustomTextFormField(
            keyboardType: TextInputType.text,
            hint: 'Nombre de empresa',
            onChanged:
                ref.read(registerProvider.notifier).onFullNameCompanyChange,
            errorMessage: registerform.isFormPosted
                ? registerform.fullNameCompany.errorMessage
                : null,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            keyboardType: TextInputType.text,
            hint: 'Razon social',
            onChanged: ref.read(registerProvider.notifier).onBusinessNameChange,
            errorMessage: registerform.isFormPosted
                ? registerform.businessName.errorMessage
                : null,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            keyboardType: TextInputType.text,
            hint: 'NIT',
            onChanged: ref.read(registerProvider.notifier).onNitChange,
            errorMessage: registerform.isFormPosted
                ? registerform.nit.errorMessage
                : null,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            keyboardType: TextInputType.text,
            hint: 'Cedula',
            onChanged: ref.read(registerProvider.notifier).onCedulaChange,
            errorMessage: registerform.isFormPosted
                ? registerform.cedula.errorMessage
                : null,
          ),
        ],
      ),
    );
  }
}
