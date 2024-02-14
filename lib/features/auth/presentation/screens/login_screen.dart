part of 'screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(children: <Widget>[
              const Positioned(
                top: -130,
                right: -120,
                child: CustomCircileOpacity(),
              ),
              const Positioned(
                bottom: 70,
                right: -130,
                child: CustomCircileOpacity(),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: SvgPicture.asset('assets/images/logo.svg'),
                  ),
                  const SizedBox(height: 8),
                  Text('Outx', style: textStyle.titleLarge),
                  const _LoginForm()
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  void showSnackbar(BuildContext context, String messageError) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(messageError)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final loginForm = ref.watch(loginFormProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Row(
            children: [
              Text('Login', style: textStyles.titleMedium),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            initialValue: loginForm.isRemember ? loginForm.email.value : null,
            keyboardType: TextInputType.emailAddress,
            hint: 'Email',
            onChanged: ref.read(loginFormProvider.notifier).onEmailChange,
            errorMessage:
                loginForm.isFormPosted ? loginForm.email.errorMessage : null,
            prefixIcon: const Icon(
              FontAwesomeIcons.envelope,
              color: Color(0xFF747688),
            ),
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            initialValue: loginForm.password.value,
            keyboardType: TextInputType.text,
            onActivateObscureText:
                ref.read(loginFormProvider.notifier).onChangeObscureText,
            isPassword: true,
            obscureText: loginForm.isObscureText,
            hint: 'Contraseña',
            onChanged: ref.read(loginFormProvider.notifier).onPasswordChanged,
            errorMessage:
                loginForm.isFormPosted ? loginForm.password.errorMessage : null,
            prefixIcon: const Icon(
              Icons.lock_outline_rounded,
              size: 24,
              color: Color(0xFF747688),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
                  Switch(
                    value: loginForm.isRemember,
                    onChanged:
                        ref.read(loginFormProvider.notifier).onChangeRemember,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  const Text(
                    'Recuerdame',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          CustomFilledButton(
            text: 'LOGIN',
            buttonColor: Colors.colorSeed,
            onPressed: loginForm.isPosting
                ? null
                : ref.read(loginFormProvider.notifier).onformSubmit,
            icon: Icons.arrow_forward_rounded,
          ),
          const SizedBox(height: 18),
          const Text(
            'O',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18),
          CustomFilledButton(
            isPrimaryButton: false,
            buttonColor: Colors.white,
            img: 'assets/images/google.png',
            text: 'Login con Google',
            onPressed: () {
              ref.read(authFirebaseProvider.notifier).signInWithGoogle();
            },
          ),
          const SizedBox(height: 8),
          CustomFilledButton(
            isPrimaryButton: false,
            buttonColor: Colors.white,
            img: 'assets/images/facebook.png',
            text: 'Login con Facebook',
            onPressed: () async {
              await ref
                  .read(authFirebaseProvider.notifier)
                  .signInWithFacebook();
            },
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿No tienes una cuenta?'),
              TextButton(
                onPressed: () {
                  if (context.canPop()) {
                    return context.pop();
                  }
                  context.push(PAGES.register.screenPath);
                },
                child: const Text('Registro'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
