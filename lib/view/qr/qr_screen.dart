import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 16.0),
              //   child: GestureDetector(
              //     onTap: () => Navigator.pop(context),
              //     child: SvgPicture.asset(
              //       'assets/icons/arrow_right_ic.svg',
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              const Text(
                "Open on Mobile",
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff596992),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Scan with your phone’s camera or QR code app to view.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff8E95A7),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: Center(
                  child: QrImageView(
                    data: 'This is a simple QR code',
                    version: QrVersions.auto,
                    size: 320,
                    gapless: true,
                    backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(24),
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
