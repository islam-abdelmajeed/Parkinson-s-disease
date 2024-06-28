// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:graduation_project/view/feedback&support_page.dart';
import 'package:graduation_project/view/instructions/instructions_screen.dart';
import 'package:graduation_project/view/login/login_page.dart';
import 'package:graduation_project/view/profile/profile_page.dart';
import 'package:graduation_project/widgets/app_toasts.dart';
import '../../globalData.dart';
import '../../logic/home/home_provider.dart';
import '../../widgets/app_error_widget.dart';
import '../disease_diagnosis/disease_diagnosis_screen.dart';
import '../doctors/doctors_page.dart';
import '../exercises/exercises_screen.dart';
import 'widgets/measurement.dart';

class ServiceObject {
  final List<Color> gradient;
  final List<Widget> children;
  final Widget route;

  ServiceObject({
    required this.gradient,
    required this.route,
    required this.children,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Color> cardMainGradient = [
    const Color(0xffE5F1FF),
    const Color(0xffCBE4F2).withOpacity(0.2),
  ];

  var _otherServices = [];

  List<Widget> _drawerItems = [];

  @override
  void initState() {
    super.initState();
    _otherServices = [
      ServiceObject(
        gradient: cardMainGradient,
        route: const DiseaseDiagnosisScreen(),
        children: [
          SvgPicture.asset('assets/images/disease_diagnosis.svg'),
          const SizedBox(height: 16),
          const Text(
            'Disease Diagnosis',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff596992),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      ServiceObject(
        gradient: cardMainGradient,
        route: const SizedBox(),
        children: [
          SvgPicture.asset('assets/images/heart_rate.svg'),
          const SizedBox(height: 16),
          const Text(
            'Heart Rate',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff596992),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Consumer<HomeProvider>(
            builder: (context, homeProvider, child) {
              return Text(
                '${homeProvider.bpm.toInt()}/120 beats/minute',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff8E95A7),
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
        ],
      ),
      ServiceObject(
        gradient: cardMainGradient,
        route: const ExercisesScreen(),
        children: [
          SvgPicture.asset('assets/images/exercises.svg'),
          const SizedBox(height: 16),
          const Text(
            'Exercises',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff596992),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      ServiceObject(
        gradient: [
          const Color(0xffDBEBFE),
          const Color(0xffCBE4F2).withOpacity(0.2),
        ],
        route: const DoctorsPage(),
        children: [
          SvgPicture.asset('assets/images/doctors.svg'),
          const SizedBox(height: 16),
          const Text(
            'Doctors',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff596992),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ];

    // _drawerItems = [
    //
    // ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _drawerItems = [
      DrawerItem(
        iconPath: "assets/icons/menu_ic.svg",
        onTap: () => _scaffoldKey.currentState!.closeDrawer(),
      ),
      DrawerItem(
        iconPath: "assets/icons/profile_ic.svg",
        title: "Profile",
        onTap: () {
          _scaffoldKey.currentState!.closeDrawer();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfilePage(),
            ),
          );
        },
      ),
      DrawerItem(
        iconPath: "assets/icons/instructions_ic.svg",
        title: "Instructions",
        onTap: () {
          _scaffoldKey.currentState!.closeDrawer();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InstructionsScreen(),
            ),
          );
        },
      ),
      DrawerItem(
        iconPath: "assets/icons/feedback_ic.svg",
        title: "Feedback&Support",
        onTap: () {
          _scaffoldKey.currentState!.closeDrawer();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SupportPage(),
            ),
          );
        },
      ),
      DrawerItem(
        iconPath: "assets/icons/logout_ic.svg",
        title: "Logout",
        onTap: () {
          _scaffoldKey.currentState!.closeDrawer();
          context.read<HomeProvider>().logout().whenComplete(() {
            if (context.read<HomeProvider>().status == HomeStatus.loggedOut) {
              AppToasts.success(msg: "Logged out successfully");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
              return;
            }
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: const Color(0xff6DB3F4),
        child: ListView.separated(
          itemCount: _drawerItems.length,
          separatorBuilder: (context, index) => Container(
            height: 1,
            width: double.infinity,
            color: Colors.white,
          ),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 27,
            ),
            child: _drawerItems[index],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<HomeProvider>(builder: (_, value, ___) {
              if (value.status == HomeStatus.failure && value.errorMessage != null) {
                return AppErrorWidget(
                  msg: value.errorMessage ?? defaultErrorMessage,
                  onRetry: value.resetState,
                );
              }

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => _scaffoldKey.currentState!.openDrawer(),
                          child: SvgPicture.asset('assets/icons/menu_ic.svg'),
                        ),
                        SvgPicture.asset('assets/icons/home_logo_ic.svg'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // const CustomViewMeasurement(),
                  Container(
                    width: double.infinity,
                    // height: 70,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffDAEAFD),
                          Color(0xffF1F4FF),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.12,
                          2
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 24.0),
                            child: Text(
                              "Glovy Measurement",
                              style: TextStyle(
                                fontSize: 22,
                                color: Color(0xffA3A9B8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          LiveLineChart(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Other Services',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff596992),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 14, mainAxisSpacing: 12, childAspectRatio: 0.8),
                        itemBuilder: (context, index) {
                          final serviceCard = _otherServices[index];
                          return OtherServicesCard(
                            gradient: serviceCard.gradient,
                            route: serviceCard.route,
                            children: serviceCard.children,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class OtherServicesCard extends StatelessWidget {
  final List<Color> gradient;
  final Widget route;
  final List<Widget> children;

  const OtherServicesCard({
    super.key,
    required this.gradient,
    required this.route,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => route,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.iconPath,
    required this.onTap,
    this.iconColor,
    this.title,
  });

  final String iconPath;
  final String? iconColor;
  final String? title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          if (title != null)
            Text(
              title!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xffFEFEFE),
              ),
            ),
        ],
      ),
    );
  }
}
