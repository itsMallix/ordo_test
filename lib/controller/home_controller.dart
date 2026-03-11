import 'package:get/get.dart';

class HomeController extends GetxController {
  final _isEmpty = true.obs;
  bool get isEmpty => _isEmpty.value;

  final _isExploring = false.obs;
  bool get isExploring => _isExploring.value;

  final _isSliderLoading = false.obs;
  bool get isSliderLoading => _isSliderLoading.value;

  void setEmpty(bool value) {
    _isEmpty.value = value;
  }

  Future<void> startExplore() async {
    _isExploring.value = true;
    // Simulate loading
    await Future.delayed(const Duration(seconds: 1));
    _isEmpty.value = false;
    _isExploring.value = false;
  }

  void setSliderLoading(bool value) {
    _isSliderLoading.value = value;
  }

  Future<void> triggerSliderLoading() async {
    _isSliderLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    _isSliderLoading.value = false;
  }
}
