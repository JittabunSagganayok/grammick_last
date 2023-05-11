import 'package:get/get.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/widgets/error_dialog_widget.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/widgets/info_dialog_widget.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/widgets/success_dialog_widget.dart';

class DialogMessage {
  static void showError({required String content}) {
    Get.dialog(
      ErrorDialogWidget(
        content: content,
        onSubmit: () => Get.back(),
      ),
      barrierDismissible: false,
    );
  }

  static void showSuccess({
    required String title,
    required String content,
    required String btnText,
    required Function onPressed,
  }) {
    Get.dialog(
      SuccessDialogWidget(
        title: title,
        content: content,
        submitText: btnText,
        onSubmit: () => onPressed(),
        submitButton: true,
      ),
      barrierDismissible: false,
    );
  }

  static void showInfo({
    required String title,
    required String content,
    required String btnText,
    required Function onConfirm,
    required Function onCancle,
  }) {
    Get.dialog(
      InfoDialogWidget(
        title: title,
        content: content,
        submitText: btnText,
        onSubmit: () => onConfirm(),
        onCancle: () => onCancle(),
        submitButton: true,
      ),
      barrierDismissible: false,
    );
  }
}
