part of features.auth.providers.company;

class AuthNotifier extends StateNotifier<CompanyState> {
  AuthNotifier() : super(CompanyState());

  void registerUser({
    required String email,
    required String password,
    required String fullName,
    required String gender,
    required String type,
  }) async {}
}
