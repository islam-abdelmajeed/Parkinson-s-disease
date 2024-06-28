class DiseasePredictionResponse {
  final double? score;
  final String? label;

  const DiseasePredictionResponse({
    required this.score,
    required this.label,
  });

  factory DiseasePredictionResponse.fromJson(Map<String, dynamic> json) =>
      DiseasePredictionResponse(
        score: json['score'] ?? 0.0,
        label: json['label'] ?? "",
      );
}
