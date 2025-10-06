import 'package:get/get.dart';
import 'package:jsulima/core/services/shared_preferences_helper.dart';

class BottomNavbarController extends GetxController {
  var selectedIndex = 0.obs;
  var token = RxnString();

  @override
  void onInit() {
    super.onInit();
    loadToken();
  }

  Future<void> loadToken() async {
    token.value = await SharedPreferencesHelper.getAccessToken();
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}