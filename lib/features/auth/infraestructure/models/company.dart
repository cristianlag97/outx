class CompanyModel {
  final String fullNameCompany;
  final String nit;
  final String reasonSocial;
  final String cedula;
  final String category;

  CompanyModel({
    required this.fullNameCompany,
    required this.nit,
    required this.reasonSocial,
    required this.cedula,
    required this.category,
  });

  CompanyModel.fromJson(Map<String, dynamic> json)
      : fullNameCompany = json['fullNameCompany'] ?? '',
        nit = json['nit'] ?? '',
        reasonSocial = json['reasonSocial'] ?? '',
        cedula = json['cedula'] ?? '',
        category = json['category'] ?? '';

  Map<String, dynamic> toJson() => {
        "fullNameCompany": fullNameCompany,
        "nit": nit,
        "reasonSocial": reasonSocial,
        "cedula": cedula,
        "category": category,
      };
}
