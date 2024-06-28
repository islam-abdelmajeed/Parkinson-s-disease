import 'package:equatable/equatable.dart';

class UpdatePasswordParams extends Equatable {
  final String oldPassword;
  final String password;
  final String confirmPassword;
  final String email;

  const UpdatePasswordParams({
    required this.oldPassword,
    required this.password,
    required this.confirmPassword,
    required this.email,
  });

  @override
  List<Object> get props => [
    oldPassword,
    password,
    confirmPassword,
    email,
  ];

  Map<String, dynamic> toJson() {
    return {
      'old_password': oldPassword,
      'new_password': password,
      'new_password_confirmation': confirmPassword,
      'email': email,
    };
  }
}
