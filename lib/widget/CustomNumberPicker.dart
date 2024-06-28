import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class CustomNumberPicker extends StatefulWidget {
   CustomNumberPicker({
    super.key, required this.minValue, required this.maxValue, required this.value,

  });

  final int minValue;

  final int maxValue;



 int value;



  @override
  State<CustomNumberPicker> createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,

        decoration: BoxDecoration(
          boxShadow:  [
            BoxShadow(
              color: Colors.grey[600]!,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(2, 5), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[400],

        ),
        child:SingleChildScrollView(
          child: NumberPicker(
              infiniteLoop: true,
              selectedTextStyle: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 35
              ),
              textStyle: TextStyle(
                color: Colors.grey.withOpacity(0.9),
                fontSize: 20,
              ),
              decoration: BoxDecoration(
                  border:Border(
                    top: BorderSide(
                        color: Colors.grey[500]!),

                    bottom: BorderSide(
                        color: Colors.grey[500]!),
                  )
              ),
              itemWidth: 80,
              itemHeight: 90,
              zeroPad: true,
              minValue: widget.minValue,
              maxValue:widget.maxValue,
              value:widget.value,
              onChanged:(value){
                setState(() {
                  widget.value=value;

                });

              }),
        )

    );
  }

}
