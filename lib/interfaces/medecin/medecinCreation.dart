class MedecinCreation {
  final String name;
  final String firstName;
  final String address;
  final String zipCode;
  final String city;
  final String email;
  final String password;
  final String userType;
  final int matricule;
  final int limiteClient;
  final String speciality;

  MedecinCreation({
    required this.name,
    required this.firstName,
    required this.address,
    required this.zipCode,
    required this.city,
    required this.email,
    required this.password,
    required this.userType,
    required this.matricule,
    required this.limiteClient,
    required this.speciality,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'firstName': firstName,
      'address': address,
      'zipCode': zipCode,
      'city': city,
      'email': email,
      'password': password,
      'userType': userType,
      'matricule': matricule,
      'limiteClient': limiteClient,
      'speciality': speciality
    };
  }

}