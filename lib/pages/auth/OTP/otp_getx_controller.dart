// dart imports:
import 'dart:async';

// project imports:
import 'package:copy_tokopedia/core.dart';

class OTPGetxController extends GetxController {
  var timeLimit = 0.obs;
  var isVerified = true.obs;
  Timer? countdownTimer;

  String strDigits(int n) => n.toString().padLeft(2, '0');
  @override
  void onInit() {
    super.onInit();
    initVariable();
    startTimer();
  }

  @override
  void onClose() {
    super.onClose();
    resetTimer();
  }

  void initVariable() {
    timeLimit(45);
  }

  void setCountDown() {
    if (timeLimit.value == 0) {
      countdownTimer?.cancel();
    } else {
      timeLimit--;
    }
  }

  void startTimer() {
    const reduceSecondsBy = Duration(seconds: 1);
    countdownTimer = Timer.periodic(reduceSecondsBy, (_) => setCountDown());
  }

  void stopTimer() {
    countdownTimer?.cancel();
  }

  void resetTimer() {
    stopTimer();
    timeLimit(45);
  }

  void verifyCode(String value) {
    if (value != '222222') {
      isVerified(false);
      return;
    }
  }
}
