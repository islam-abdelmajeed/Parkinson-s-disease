import 'package:flutter/material.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/widget/CustomLineChart.dart';
import 'package:graduation_project/widget/CustomText.dart';

import '../models/LineChartModel.dart';

class CustomViewMeasurement extends StatelessWidget {
  const CustomViewMeasurement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          gradient: LinearGradient(
              colors: [primaryColor, Colors.white54],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                    fontWeight: FontWeight.bold,
                    text: "vibrations",
                    size: 20,
                    color: Color(0xffA3A9B8),
                    textAlign: TextAlign.center)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomLineChart(points: getLineChartData),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                  fontWeight: FontWeight.bold,
                  text: "time(by day)",
                  size: 20,
                  color: Color(0xffA3A9B8),
                  textAlign: TextAlign.center)
            ],
          ),
        ],
      ),
    );
  }
}
