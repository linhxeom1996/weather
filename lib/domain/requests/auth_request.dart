class SignUpRequest {
  final String firstname;
  final String lastname;
  final String email;
  final String username;
  final String password;
  SignUpRequest(
      {required this.email,
      required this.firstname,
      required this.lastname,
      required this.password,
      required this.username});
}

class LoginRequest {
  final String username;
  final String password;
  LoginRequest({required this.password, required this.username});
}
