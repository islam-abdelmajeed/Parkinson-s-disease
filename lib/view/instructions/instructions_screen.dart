import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset("assets/icons/arrow_right_ic.svg"),
        ),
        title: const Text("Instructions"),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Learn how to use the glove",
                  style: TextStyle(
                    color: Color(0xff596992),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: Image.asset("assets/images/instructions_video.png"),
                ),
              ),
              const Text(
                "The instructions to be followed to use the gloves:",
                style: TextStyle(
                  color: Color(0xff596992),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: Column(
                  children: List.generate(
                    30,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: RichText(
                        text: TextSpan(
                          text:
                              "${index + 1}.Consult with a healthcare professional: ",
                          style: const TextStyle(
                            color: Color(0xff596992),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          children: const [
                            TextSpan(
                              text:
                                  "Before using any assistive device,including Parkinson's gloves, it's essential to consult with a healthcare professional.",
                              style: TextStyle(
                                color: Color(0xff8E95A7),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
