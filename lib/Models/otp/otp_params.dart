import 'package:equatable/equatable.dart';

class OtpParams extends Equatable {
  final String? email;
  final String? code;

  const OtpParams({
    this.email,
    this.code,
  });

  @override
  List<Object?> get props => [
        email,
        code,
      ];

  Map<String, dynamic> toJson() => {
    'email': email,
    'code': code,
  };
}
