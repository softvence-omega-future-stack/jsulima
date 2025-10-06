import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsulima/core/utils/constants/image_path.dart';
import 'package:jsulima/features/auth/login/screen/login_screen.dart';

class GuestProfilePlaceholder extends StatelessWidget {
  const GuestProfilePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePath.splashBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.grey.shade900,
            child: Icon(
              Icons.person_outline,
              color: Colors.white.withOpacity(0.8),
              size: 45,
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "Now you're a guest",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            "Login to your account to access your profile, notification and settings.",
            textAlign: TextAlign.center,
            style: TextStyle(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 30),

          ElevatedButton(
            onPressed: () {
              Get.offAll(LoginScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E1E20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              elevation: 4,
              shadowColor: Colors.black54,
            ),
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
