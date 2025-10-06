import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsulima/core/utils/constants/image_path.dart';
import 'package:jsulima/features/bottom_navbar/controller/bottom_navbar_controller.dart';

import 'package:jsulima/features/games/screen/games_screen.dart';
import 'package:jsulima/features/home/screen/home_screen.dart';
import 'package:jsulima/features/profile/screen/guest_profile_placeholder.dart';

import 'package:jsulima/features/profile/screen/profile_screen.dart';

import 'package:jsulima/features/notifications/screen/notification_screen.dart';


class BottomNavbarScreen extends StatelessWidget {
  BottomNavbarScreen({super.key});

  final BottomNavbarController controller = Get.put(BottomNavbarController());

  final List<String> activeIcons = [
    ImagePath.activeHome,
    ImagePath.activeGames,
    ImagePath.activeNotification,
    ImagePath.activeProfile,
  ];

  final List<String> inactiveIcons = [
    ImagePath.inactiveHome,
    ImagePath.inactiveGames,
    ImagePath.inactiveNotification,
    ImagePath.inactiveProfile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0D0F),
      body: Obx((){
        final screens = [
           HomeScreen(),
           GamesScreen(),
           NotificationScreen(),
          controller.token.value != null
              ?  ProfileScreen()
              : GuestProfilePlaceholder(), 
        ];
        return screens[controller.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          color: Color(0xFF0D0D0F),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                final isSelected = controller.selectedIndex.value == index;
                return GestureDetector(
                  onTap: () => controller.changeIndex(index),
                  child: Image.asset(
                    isSelected ? activeIcons[index] : inactiveIcons[index],
                    width: 40,
                    height: 40,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
