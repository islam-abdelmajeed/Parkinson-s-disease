class ForgotPasswordResponseModel {
  final String message;
  final String status;

  const ForgotPasswordResponseModel(
    this.message,
    this.status,
  );

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponseModel(
      json['message'] as String,
      json['status'] as String,
    );
  }
}
