import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/colosrConstants.dart';
import '../../constant/stylesConstants.dart';

class WeAppBar extends StatelessWidget {
  String title;
  Function? onBackPressed;
  List<Widget>? actionsButton;
  Widget? widgetTitle;
  bool showCloseIcon;
  Widget? flexibleSpace, navigationIcon;
  num expandedHeight;
  num radius;
  Color? titleColor, backgroundColor;

  WeAppBar({
    required this.title,
    this.navigationIcon,
    this.onBackPressed,
    this.titleColor,
    this.backgroundColor,
    this.actionsButton,
    this.widgetTitle,
    this.showCloseIcon = false,
    this.flexibleSpace,
    this.expandedHeight = 80,
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 80,
      expandedHeight: expandedHeight.toDouble(),
      backgroundColor: backgroundColor ?? blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(radius.toDouble()),
        ),
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: navigationIcon ??
          IconButton(
            onPressed: () {
              onBackPressed?.call();
            },
            icon: SvgPicture.asset(showCloseIcon
                ? 'assets/icon_close.svg'
                : flexibleSpace != null
                    ? 'assets/icon_back_overlay.svg'
                    : 'assets/icon_back.svg'),
          ),
      actions: actionsButton ?? [],
      centerTitle: true,
      title: widgetTitle ??
          Text(
            title,
            style:
                titleWhiteAppbar?.copyWith(color: titleColor ?? Colors.white),
          ),
      flexibleSpace: flexibleSpace ??
          SizedBox(
            height: 0,
          ),
    );
  }
}
