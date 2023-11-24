class Login {
  final String email;
  final String password;
  final String userType;

  Login({
    required this.email,
    required this.password,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'userType': userType,
    };
  }
}
