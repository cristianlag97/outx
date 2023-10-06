part of features.auth.presentation.screens;

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final textStyles = Theme.of(context).textTheme;

    final isCompany = ref.watch(registerProvider).isCompany;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: GeometricalBackground(
              child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (!context.canPop()) return;
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back_rounded,
                        size: 40, color: Colors.white)),
                const Spacer(flex: 1),
                Text('Crear cuenta',
                    style:
                        textStyles.titleLarge?.copyWith(color: Colors.white)),
                const Spacer(flex: 2),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              height: size.height - 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: isCompany ? _RegisterFormCompany() : _RegisterForm(),
            )
          ],
        ),
      ))),
    );
  }
}

class _RegisterForm extends ConsumerWidget {
  _RegisterForm();

  void showSnackbar(BuildContext context, String messageError) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(messageError)),
    );
  }

  final List<String> items = ['Hombre', 'Mujer', 'Otros'];
  final List<String> items2 = ['Persona', 'Empresa'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late String selectValue = 'Hombre';
    late String selectValu2 = 'Persona';
    final textStyles = Theme.of(context).textTheme;

    final registerform = ref.watch(registerProvider);

    ref.listen(authFirebaseProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            Text('Nueva cuenta', style: textStyles.titleMedium),
            const SizedBox(height: 30),
            CustomTextFormField(
              label: 'Nombre completo',
              keyboardType: TextInputType.emailAddress,
              onChanged: ref.read(registerProvider.notifier).onFullNameChange,
              errorMessage: registerform.isFormPosted
                  ? registerform.fullName.errorMessage
                  : null,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: 'Correo',
              keyboardType: TextInputType.emailAddress,
              onChanged: ref.read(registerProvider.notifier).onEmailChange,
              errorMessage: registerform.isFormPosted
                  ? registerform.email.errorMessage
                  : null,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              style: const TextStyle(fontSize: 16, color: Colors.black54),
              value: selectValue,
              items: items
                  .map((e) => DropdownMenuItem(
                        value: e, // Asigna el valor del elemento
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                ref
                    .read(registerProvider.notifier)
                    .onSelectGender(value ?? selectValue);
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: ref.read(registerProvider.notifier).onPasswordChanged,
              errorMessage: registerform.isFormPosted
                  ? registerform.password.errorMessage
                  : null,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              // // controller: _repeatPasswordController,
              // focusNode: _repeatPasswordFocusNode,
              onFieldSubmitted: (_) =>
                  ref.read(registerProvider.notifier).onSubmit(),
              label: 'Repita la contraseña',
              obscureText: true,
              onChanged:
                  ref.read(registerProvider.notifier).onRepeatPasswordChanged,
              errorMessage: registerform.isFormPosted
                  ? registerform.repeatPassword.errorMessage
                  : null,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              style: const TextStyle(fontSize: 16, color: Colors.black54),
              value: selectValu2,
              items: items2
                  .map((e) => DropdownMenuItem(
                        value: e, // Asigna el valor del elemento
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                ref
                    .read(registerProvider.notifier)
                    .onSelectType(value ?? selectValu2);
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomFilledButton(
                  text: registerform.type == 'Empresa' ? 'Siguiente' : 'Crear',
                  buttonColor: Colors.black,
                  onPressed: () {
                    if (registerform.type == 'Empresa') {
                      ref.read(registerProvider.notifier).onSelectcompay();
                    } else {
                      ref.read(registerProvider.notifier).onSubmit();
                    }
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿Ya tienes cuenta?'),
                TextButton(
                    onPressed: () {
                      if (context.canPop()) {
                        return context.pop();
                      }
                      context.go('/login');
                    },
                    child: const Text('Ingresa aquí'))
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class _RegisterFormCompany extends ConsumerWidget {
  _RegisterFormCompany();

  void showSnackbar(BuildContext context, String messageError) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(messageError)),
    );
  }

  final List<String> items2 = ['Deportes', 'Comida'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late String selectValu2 = 'Deportes';
    final textStyles = Theme.of(context).textTheme;

    final registerform = ref.watch(registerProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            Text('Cuenta empresa', style: textStyles.titleMedium),
            const SizedBox(height: 30),
            CustomTextFormField(
              label: 'Nombre Empresa',
              keyboardType: TextInputType.text,
              onChanged:
                  ref.read(registerProvider.notifier).onFullNameCompanyChange,
              errorMessage: registerform.isFormPosted
                  ? registerform.fullName.errorMessage
                  : null,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: 'NIT',
              keyboardType: TextInputType.number,
              onChanged: ref.read(registerProvider.notifier).onNitChange,
              errorMessage: registerform.isFormPosted
                  ? registerform.email.errorMessage
                  : null,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: 'Razón social',
              keyboardType: TextInputType.text,
              onChanged:
                  ref.read(registerProvider.notifier).onBusinessNameChange,
              errorMessage: registerform.isFormPosted
                  ? registerform.email.errorMessage
                  : null,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: 'Cedula',
              keyboardType: TextInputType.number,
              onChanged: ref.read(registerProvider.notifier).onCedulaChange,
              errorMessage: registerform.isFormPosted
                  ? registerform.password.errorMessage
                  : null,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              style: const TextStyle(fontSize: 16, color: Colors.black54),
              value: selectValu2,
              items: items2
                  .map((e) => DropdownMenuItem(
                        value: e, // Asigna el valor del elemento
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                ref
                    .read(registerProvider.notifier)
                    .onSelectCategory(value ?? selectValu2);
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomFilledButton(
                  text: 'Crear',
                  buttonColor: Colors.black,
                  onPressed: () {
                    ref.read(registerProvider.notifier).onSubmit();
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿Ya tienes cuenta?'),
                TextButton(
                    onPressed: () {
                      if (context.canPop()) {
                        return context.pop();
                      }
                      context.go('/login');
                    },
                    child: const Text('Ingresa aquí'))
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
