import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/widgets/button_widget.dart';

class InfoDialogWidget extends StatelessWidget {
  const InfoDialogWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.submitButton,
    required this.onCancle,
    required this.submitText,
    this.onSubmit,
  }) : super(key: key);

  final String title;
  final String content;
  final bool submitButton;
  final String submitText;
  final VoidCallback? onSubmit;
  final VoidCallback? onCancle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(8),
      contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(26)),
      ),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: Image.asset(
                  'assets/icons/alert_info.png',
                  width: 42,
                  height: 42,
                ),
              ),
              const SizedBox(height: 10),
              Text(title,
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          content.isNotEmpty
              ? Text(content,
                  style: GoogleFonts.kanit(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: const Color(0XFF7E7E7E)))
              : const SizedBox.shrink(),
          const SizedBox(height: 20),
          submitButton == true
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ButtonWidget(
                    onPressed: onSubmit,
                    height: 48,
                    width: 197,
                    radius: 20,
                    title: "Confirm",
                    fontColor: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    bgColor: const Color(0xFFFDCD03),
                  ),
                )
              : const SizedBox.shrink(),
          TextButton(
            onPressed: onCancle,
            child: Center(
              child: Text(
                "Cancle",
                style: GoogleFonts.kanit(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
      buttonPadding: EdgeInsets.zero,
    );
  }
}
