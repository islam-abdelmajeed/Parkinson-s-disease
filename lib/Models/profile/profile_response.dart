class ProfileResponseModel {
  final int? id;
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? birthDate;
  final String? avatar;

  const ProfileResponseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.avatar,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
    id: json['user']['id'] ?? 0,
    username: json['user']['username'] ?? '',
    email: json['user']['email'] ?? '',
    phoneNumber: json['user']['phoneNumber'] ?? '',
    birthDate: json['user']['birthdate'] ?? '',
    avatar: json['user']['photo'] ?? '',
  );

}
