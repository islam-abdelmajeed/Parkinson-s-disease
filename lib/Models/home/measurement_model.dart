class MeasurementModel {
  final int? bpm;
  final double? vibration;

  MeasurementModel({
    required this.bpm,
    required this.vibration,
  });

  factory MeasurementModel.fromJson(Map<String, dynamic> json) =>
      MeasurementModel(
        bpm: json['BPM'],
        vibration: json['Vibration'],
      );
}
