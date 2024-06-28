import 'package:equatable/equatable.dart';

class RegistrationParams extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String birthDate;
  final String password;
  final String passwordConfirmation;

  const RegistrationParams(
    this.name,
    this.email,
    this.phone,
    this.birthDate,
    this.password,
    this.passwordConfirmation,
  );

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        birthDate,
        password,
        passwordConfirmation,
      ];

  Map<String, dynamic> toJson() {
    return {
      'username': name,
      'email': email,
      'phoneNumber': phone,
      'birthdate': birthDate,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
