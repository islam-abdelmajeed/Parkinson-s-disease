import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/globalData.dart';
import 'package:graduation_project/widgets/app_elevated_button.dart';
import 'package:graduation_project/widgets/app_error_widget.dart';
import 'package:graduation_project/widgets/prediction_result_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../logic/disease_diagnosis/disease_diagnosis_provider.dart';
import '../../widgets/app_toasts.dart';

class DiseaseDiagnosisScreen extends StatelessWidget {
  const DiseaseDiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DiseaseDiagnosisProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset("assets/icons/arrow_right_ic.svg"),
          ),
          title: const Text(
            'Parkinson’s detector',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xff8E95A7)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Consumer<DiseaseDiagnosisProvider>(
            builder: (context, value, child) {
              if (value.status == DiseaseDiagnosisStatus.failure &&
                  value.errorMessage != null) {
                return AppErrorWidget(
                  msg: value.errorMessage ?? defaultErrorMessage,
                  onRetry: value.resetState,
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                      border: Border.all(
                        color: const Color(0xff596992),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (value.pickedImageFile != null) ...[
                          Container(
                            height: 200,
                            width: 200,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.file(
                              value.pickedImageFile!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ] else ...[
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: SvgPicture.asset(
                                "assets/images/pick_image.svg"),
                          ),
                        ],
                        const SizedBox(height: 10),
                        const Text(
                          "Drop your draw here",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff596992),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => context
                                  .read<DiseaseDiagnosisProvider>()
                                  .pickImage(source: ImageSource.gallery),
                              icon: SvgPicture.asset(
                                  "assets/images/gallery_button.svg"),
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              "Or",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff8E95A7),
                              ),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () => context
                                  .read<DiseaseDiagnosisProvider>()
                                  .pickImage(source: ImageSource.camera),
                              icon: SvgPicture.asset(
                                  "assets/images/camera_button.svg"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  AppElevatedButton(
                    onPressed: () {
                      AppToasts.hint(
                          msg:
                              "Your image has been uploaded and you will now the result as soon as possible, please be patient");
                      value.predictDisease().whenComplete(() {
                        if (value.status == DiseaseDiagnosisStatus.success) {
                          final hasTheDisease =
                              (value.resultLabel == "healthy") ? false : true;
                          PredictionResultDialog.show(context,
                              hasTheDisease: hasTheDisease);

                          return;
                        }
                      });
                    },
                    label: "Predict",
                    isLoading: value.status == DiseaseDiagnosisStatus.loading,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
