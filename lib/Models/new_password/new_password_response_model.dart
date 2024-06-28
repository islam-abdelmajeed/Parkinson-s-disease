class NewPasswordResponseModel {
  final String message;
  final bool status;

  const NewPasswordResponseModel(
    this.message,
    this.status,
  );

  factory NewPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return NewPasswordResponseModel(
      json['message'],
      json['status'],
    );
  }
}
