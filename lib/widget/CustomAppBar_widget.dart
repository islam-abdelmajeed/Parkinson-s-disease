// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//     required this.color,
//     this.imageWidth,
//     this.imageHeight,
//   });

//   final double? imageWidth;
//   final double? imageHeight;

//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 280,
//       padding: const EdgeInsets.only(
//         top: 70,
//         bottom: 20,
//       ),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(100),
//           bottomRight: Radius.circular(100),
//         ),
//       ),
//       child: SvgPicture.asset(
//         "assets/images/glovy_logo.svg",
//       ),
//     );
//   }
// }
