import 'package:collection/collection.dart';
class LineChartModel{
  final double x;
  final double y;


  LineChartModel({required this.x, required this.y});





}
List<LineChartModel>get getLineChartData{
  final data =<double>[0, 4 , 6, 10, 3, 6  ,4];

  return data.mapIndexed(
      (  (index,element)=>LineChartModel(x: index.toDouble(), y: element)))
      .toList();
}



