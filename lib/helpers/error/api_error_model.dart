import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable(
  createToJson: false
)
class ApiErrorModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(includeFromJson: false)
  final int? code;

  ApiErrorModel({
    this.message = "something went wrong, please try again",
    this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
}