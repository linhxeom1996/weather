import 'package:equatable/equatable.dart';
import 'package:softbase/domain/models/reponses/status_reponse.dart';

class RegisterReponse extends Equatable {
  final StatusResponse? status;
  final DataUser? data;

  const RegisterReponse({this.data, this.status});

  @override
  List<Object?> get props => [status, data];

  @override
  bool get stringify => true;
}

class DataUser {
  final String? activatedAt;
  final String? createdAt;
  final String? email;
  final String? username;
  final String? firstname;
  final String? id;
  final String? lastname;
  final String? localeCode;
  final String? phone;
  final String? status;

  DataUser(
      {this.activatedAt,
      this.createdAt,
      this.email,
      this.username,
      this.firstname,
      this.id,
      this.lastname,
      this.localeCode,
      this.phone,
      this.status});

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      activatedAt:
          json['activated_at'] != null ? json['activated_at'] as String : null,
      createdAt:
          json['created_at'] != null ? json['created_at'] as String : null,
      email: json['email'] != null ? json['email'] as String : null,
      username: json['username'] != null ? json['username'] as String : null,
      firstname: json['firstname'] != null ? json['firstname'] as String : null,
      id: json['id'] != null ? json['id'] as String : null,
      lastname: json['lastname'] != null ? json['lastname'] as String : null,
      localeCode:
          json['locale_code'] != null ? json['locale_code'] as String : null,
      phone: json['phone'] != null ? json['phone'] as String : null,
      status: json['status'] != null ? json['status'] as String : null,
    );
  }
}

class LoginReponse extends Equatable {
  final StatusResponse? status;
  final DataUser? data;
  const LoginReponse({this.data, this.status});

  @override
  List<Object?> get props => [status, data];

  @override
  bool get stringify => true;

  factory LoginReponse.fromMap(Map<String, dynamic> map) {
    return LoginReponse(
        status: map['status'] != null
            ? StatusResponse.fromJson(map['status'])
            : null,
        data: map['data'] != null
            ? DataUser.fromJson(map['data'])
            : null);
  }
}
