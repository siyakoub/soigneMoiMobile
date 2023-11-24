class UserUpdate {
  final String name;
  final String firstName;
  final String address;
  final String zipCode;
  final String city;
  final String email;
  final String password;
  final String userType;

  UserUpdate({
    required this.name,
    required this.firstName,
    required this.address,
    required this.zipCode,
    required this.city,
    required this.email,
    required this.password,
    required this.userType,
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
    };
  }
}