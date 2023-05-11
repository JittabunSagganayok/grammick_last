import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeTextFieldBorderWidget extends StatelessWidget {
  String value = '';
  String hintLabel = '';
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color textColor;
  Color borderColor;
  Function onTextChanged;

  TextEditingController? textEditingController;
  bool readOnly;

  Function? onTap;
  FocusNode? node;

  int minLines = 1;
  int maxLines = 1;

  WeTextFieldBorderWidget({
    required this.hintLabel,
    required this.textColor,
    required this.borderColor,
    required this.onTextChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.textEditingController,
    this.readOnly = false,
    this.onTap,
    this.node,
    this.minLines = 1,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    if (textEditingController == null) {
      textEditingController = TextEditingController();
    }

    textEditingController?.text = value;
    textEditingController?.selection = TextSelection.fromPosition(
        TextPosition(offset: textEditingController?.text.length ?? 0));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: TextField(
        focusNode: node ?? FocusNode(),
        controller: textEditingController,
        onChanged: (text) {
          onTextChanged.call(text);
        },
        readOnly: readOnly,
        onTap: () {
          onTap?.call();
        },
        style: GoogleFonts.kanit(
          textStyle: TextStyle(
            fontSize: 13,
            color: textColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: Color(4),
                  width: 1,
                )),
            contentPadding: EdgeInsets.only(
              top: prefixIcon == null && suffixIcon == null ? 0 : 16,
              left: prefixIcon == null ? 16 : 0,
              right: suffixIcon == null ? 16 : 0,
            ),
            prefixIcon: prefixIcon ??
                SizedBox(
                  width: 0,
                  height: 0,
                ),
            suffixIcon: suffixIcon ??
                SizedBox(
                  width: 0,
                  height: 0,
                ),
            hintText: hintLabel,
            hintStyle: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 14,
                color: Color(0xffA9A9A9),
                fontWeight: FontWeight.w500,
              ),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
