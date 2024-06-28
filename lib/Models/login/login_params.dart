import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams(
    this.email,
    this.password,
  );

  @override
  List<Object?> get props => [
        email,
        password,
      ];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
