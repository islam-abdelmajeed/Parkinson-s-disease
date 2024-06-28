class DoctorsResponse {
  final String message;
  final List<DoctorResponse> data;

  DoctorsResponse({
    required this.message,
    required this.data,
  });

  factory DoctorsResponse.fromJson(Map<String, dynamic> json) => DoctorsResponse(
    message: json["message"],
    data: List<DoctorResponse>.from(json["data"].map((x) => DoctorResponse.fromJson(x))),
  );
}

class DoctorResponse {
  final String name;
  final String number;
  final String address;
  final String photo;

  DoctorResponse({
    required this.name,
    required this.number,
    required this.address,
    required this.photo,
  });

  factory DoctorResponse.fromJson(Map<String, dynamic> json) => DoctorResponse(
    name: json["name"],
    number: json["number"],
    address: json["address"],
    photo: json["photo"],
  );
}
