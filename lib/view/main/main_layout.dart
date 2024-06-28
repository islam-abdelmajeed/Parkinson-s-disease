import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/logic/home/home_provider.dart';
import 'package:provider/provider.dart';

import '../alarm/alarm_screen.dart';
import '../home/home_screen.dart';
import '../qr/qr_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  var _selectedIndex = 0;

  final _pages =  [
    ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
      child: const HomeScreen(),
    ),
    const QRScreen(),
    const AlarmScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _pages[_selectedIndex],
          ),
          SizedBox(
            height: 80,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBottomNavigationItem(
                      icon: 'assets/icons/home_ic.svg',
                      label: 'Home',
                      index: 0,
                    ),
                    _buildBottomNavigationItem(
                      icon: 'assets/icons/qr_ic.svg',
                      label: 'QR',
                      index: 1,
                    ),
                    _buildBottomNavigationItem(
                      icon: 'assets/icons/alarm_ic.svg',
                      label: 'Alarm',
                      index: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 90,
      //   child: Stack(
      //     alignment: Alignment.bottomCenter,
      //     children: [
      //       Container(
      //         height: 60,
      //         decoration: const BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(6),
      //             topRight: Radius.circular(6),
      //           ),
      //         ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           _buildBottomNavigationItem(
      //             icon: 'assets/icons/home_ic.svg',
      //             label: 'Home',
      //             index: 0,
      //           ),
      //           _buildBottomNavigationItem(
      //             icon: 'assets/icons/qr_ic.svg',
      //             label: 'QR',
      //             index: 1,
      //           ),
      //           _buildBottomNavigationItem(
      //             icon: 'assets/icons/alarm_ic.svg',
      //             label: 'Alarm',
      //             index: 2,
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildBottomNavigationItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        if (_selectedIndex != index) {
          setState(() {
            _selectedIndex = index;
          });
        }
      },
      child: Column(
        children: [
          if (_selectedIndex == index)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: const Size(45, 45),
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Color(0xff58B0CD),
                    width: 8,
                  ),
                ),
                shadowColor: const Color(0xff613EEA).withOpacity(0.5),
                elevation: 8,
              ),
              child: SvgPicture.asset(icon),
            )
          else
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 30.0,
                start: 16.0,
                end: 16.0,
              ),
              child: SvgPicture.asset(icon),
            ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff58B0CD),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
