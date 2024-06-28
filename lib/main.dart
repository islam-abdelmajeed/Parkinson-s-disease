import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/helpers/network_services.dart';
import 'package:graduation_project/helpers/notification_service.dart';
import 'package:graduation_project/injection_container.dart';
import 'package:graduation_project/view/main/main_layout.dart';
import 'package:graduation_project/view/onboarding/onboarding_page.dart';
import 'package:provider/provider.dart';
import 'Models/alarm/alarm_hive_storage.dart';
import 'firebase_options.dart';
import 'logic/alarm/alarm_provider.dart';
import 'logic/onboarding/onboarding_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDependencies();
  injector<FirebaseService>().getGlovesReading();
  NotificationService.init();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffF1F4FF),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xffF1F4FF),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => AlarmModel(
          const AlarmsHiveLocalStorage(),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xffF1F4FF),
              centerTitle: true,
              elevation: 0.0,
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Color(0xff8E95A7),
                fontWeight: FontWeight.w600,
              ),
            ),
            scaffoldBackgroundColor: const Color(0xffF1F4FF),
            primaryColor: const Color(0xff58B0CD),
          ),
          home: ChangeNotifierProvider(
            create: (context) => OnboardingProvider(),
            child: const OnboardingPage(),
          ),
        ),
      ),
    );
  }
}

const Color primaryColor = Color(0xffABD6E5);
