import 'package:equatable/equatable.dart';

class ForgotPasswordParams extends Equatable {
  const ForgotPasswordParams(
    this.email,
  );

  final String email;

  @override
  List<Object> get props => [email];

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
