class MedecinUpdate {
  final int matricule;
  final int limitCustomer;
  final String speciality;

  MedecinUpdate({
    required this.matricule,
    required this.limitCustomer,
    required this.speciality
  });

  Map<String, dynamic> toJson() {
    return {
      'matricule': matricule,
      'limitCustomer': limitCustomer,
      'speciality': speciality
    };
  }
}