import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.size, required this.color,required this.textAlign, this.fontWeight});
  final String text;
  final double size;
  final Color color;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize:size,
        //fontFamily: "Roboto",
        fontWeight: fontWeight,
        fontFamily:"Roboto"


      ),
    );
  }
}
