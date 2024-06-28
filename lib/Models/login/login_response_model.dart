class LoginResponseModel {
  final int? id;
  final String? token;

  const LoginResponseModel({
    required this.id,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] ?? "",
      id: json["id"] ?? 0,
    );
  }
}
