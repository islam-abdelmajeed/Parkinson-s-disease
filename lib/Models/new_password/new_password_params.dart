import 'package:equatable/equatable.dart';

class NewPasswordParams extends Equatable {
  final String password;
  final String confirmPassword;
  final String email;

  const NewPasswordParams({
    required this.password,
    required this.confirmPassword,
    required this.email,
  });

  @override
  List<Object> get props => [
        password,
        confirmPassword,
        email,
      ];

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'password_confirmation': confirmPassword,
      'email': email,
    };
  }
}
