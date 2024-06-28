import 'package:flutter/material.dart';


class CustomSaveAndCancelWidget extends StatelessWidget {
  const CustomSaveAndCancelWidget({super.key, required this.borderColor, required this.iconColor, required this.lable, required this.textColor, required this.icon, required this.onPressed});
final Color borderColor;
final Color iconColor;
final String lable;
final Color textColor;
final IconData  icon;
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 1, color:borderColor)
            ),
            child: IconButton(
                onPressed :onPressed,
                icon: Icon(
                  icon,
                  color:iconColor,
                  size: 30,
                )
            )
        ),
        const SizedBox(height: 10,),
        Text(
          lable,
          style:  TextStyle(
              color:textColor,
              fontSize: 20
          ),
        )
      ],
    );
  }
}
