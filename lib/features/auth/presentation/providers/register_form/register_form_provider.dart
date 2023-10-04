part of features.auth.providers.register_form;

final AutoDisposeStateNotifierProvider<RegisterNotifier, RegisterState>
    registerProvider =
    StateNotifierProvider.autoDispose<RegisterNotifier, RegisterState>(
        (AutoDisposeStateNotifierProviderRef<RegisterNotifier, RegisterState>
            ref) {
  final registerUserCallback = ref.watch(authProvider.notifier).registerUser;
  final registerFirebaseUserCallback =
      ref.watch(authFirebaseProvider.notifier).registerFirebase;
  return RegisterNotifier(
      registerUserCallback: registerUserCallback,
      registerFirebaseUserCallback: registerFirebaseUserCallback);
});
