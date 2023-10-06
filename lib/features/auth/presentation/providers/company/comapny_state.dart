part of features.auth.providers.company;

enum CompanyStatus { checking, created, notCreated }

class CompanyState {
  CompanyState({
    this.companyStatus = CompanyStatus.checking,
    this.company,
    this.errorMessage = '',
  });

  final CompanyStatus companyStatus;
  final Company? company;
  final String errorMessage;

  CompanyState copyWith({
    CompanyStatus? companyStatus,
    Company? company,
    String? errorMessage,
  }) =>
      CompanyState(
        companyStatus: companyStatus ?? this.companyStatus,
        company: company ?? this.company,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
