part of features.auth.providers.login_form;
//! 1 - State del provider

//! 2 - Como implementamos un notifier

//! 3 - StateNotifierProvider - consume afuera

AutoDisposeStateNotifierProvider<LoginFormNotifier, LoginFormState>
    loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  final loginUserCallback = ref.watch(authProvider.notifier).loginUser;
  final loginFirebaseUserCallback =
      ref.watch(authFirebaseProvider.notifier).loginFirebaseUser;
  return LoginFormNotifier(
    loginUserCallback: loginUserCallback,
    loginFirebaseUserCallback: loginFirebaseUserCallback,
  );
});
