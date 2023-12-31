class RegisterUserRequest {
  final String firstname;
  final String lastname;
  final String email;
  final String username;
  final String password;
  RegisterUserRequest(
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
