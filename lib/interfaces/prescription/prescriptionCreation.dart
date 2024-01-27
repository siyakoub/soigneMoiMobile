class PrescriptionCreation {
  final String medecin_email;
  final String user_email;
  final String liste;
  final String dateDebut;
  final String dateFin;

  PrescriptionCreation({
    required this.medecin_email,
    required this.user_email,
    required this.liste,
    required this.dateDebut,
    required this.dateFin
  });

  Map<String, dynamic> toJson() {
    return {
      'medecin_email': medecin_email,
      'user_email': user_email,
      'liste': liste,
      'dateDebut': dateDebut,
      'dateFin': dateFin
    };
  }

}