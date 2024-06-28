import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/globalData.dart';
import 'package:graduation_project/widgets/app_loading.dart';
import 'package:graduation_project/widgets/app_toasts.dart';
import 'package:provider/provider.dart';

import '../../logic/doctors/doctors_provider.dart';
import '../../widgets/app_error_widget.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => DoctorsProvider()..getDoctors(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset("assets/icons/arrow_right_ic.svg"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 20,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffDAEAFD),
                      Color(0xffF1F4FF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.12, 2],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/doctors_ic.svg"),
                    const SizedBox(width: 60),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Looking for doctor?",
                            style: TextStyle(
                              color: Color(0xff596992),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Check the list of the best nearest doctors",
                            style: TextStyle(
                              color: Color(0xff8E95A7),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<DoctorsProvider>(
                builder: (context, value, child) {
                  if (value.status == DoctorsStatus.loading) {
                    return const Expanded(
                      child: AppLoading(),
                    );
                  } else if (value.status == DoctorsStatus.failure &&
                      value.errorMessage != null) {
                    return Expanded(
                      child: AppErrorWidget(
                        msg: value.errorMessage ?? defaultErrorMessage,
                        onRetry: value.getDoctors,
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: value.doctors.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final doctor = value.doctors[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(
                                  color: const Color(0xffE7E7E7),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Image.network(
                                      doctor.photo,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                        width: 100,
                                        height: 100,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: const Icon(
                                          Icons.warning_rounded,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doctor.name,
                                          style: const TextStyle(
                                            color: Color(0xff596992),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/phone_ic.svg'),
                                            const SizedBox(width: 3),
                                            Text(
                                              doctor.number,
                                              style: const TextStyle(
                                                color: Color(0xff8E95A7),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/location_ic.svg'),
                                            const SizedBox(width: 3),
                                            Text(
                                              doctor.address,
                                              style: const TextStyle(
                                                color: Color(0xff8E95A7),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
