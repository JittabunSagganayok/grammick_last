import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';


final turnOnText = TextStyle(
    color: Color(0xFF383838),
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Kanit');

final turnOnCancelText = TextStyle(
    color: Color(0xFF727272),
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: 'Kanit');

final turnOnTitle = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 17,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    fontFamily: 'Kanit');

final maxHeightContain = BoxConstraints(
  maxHeight: double.infinity,
);

final appbarBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(30),
  ),
);

final titleWhiteAppbar = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w800,
    fontFamily: 'Kanit');

final titleYellowAppbar = TextStyle(
    color: yellowColor,
    fontSize: 18,
    fontWeight: FontWeight.w800,
    fontFamily: 'Kanit');

final buttonOutlinedButton = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: yellowColor,
  textStyle: TextStyle(fontSize: 18),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
  // side: BorderSide(
  //   width: 0.0,
  //   color: Color(0xFF355FF5),
  // ),
);

final regisAgree = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontFamily: 'Kanit');

final regisTerm = TextStyle(
    decoration: TextDecoration.underline,
    color: Color(0xFF22D177),
    fontSize: 12,
    fontFamily: 'Kanit');

final filterOutlinedButton = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: yellowColor,
  textStyle: TextStyle(fontSize: 18),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
  ),
  side: BorderSide(width: 1.0, color: yellowColor),
);

final filterOutlinedDisableButton = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: Colors.grey,
  textStyle: TextStyle(fontSize: 18),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
  ),
  side: BorderSide(width: 1.0, color: Colors.grey),
);

final buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Kanit',
    color: Color(0xFF363636));

final seacrhOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(14.0)),
  borderSide: BorderSide(color: Color.fromARGB(255, 194, 248, 240)),
);

final alertBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(27),
    ));

final alertOutlinedButton = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: yellowColor,
  textStyle: TextStyle(fontSize: 13),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
  side: BorderSide(width: 0.0, color: yellowColor),
);

final titleAuthText = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 30,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    fontFamily: 'Kanit');

final subTitleAuthText = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontFamily: 'Kanit');

final fildPhoneNum = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(8),
  ),
);

final phoneNumText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: 'Kanit',
    color: Color(0xFF1B1D21));

final phonNumHintText = TextStyle(
  fontFamily: 'Kanit',
  fontWeight: FontWeight.w500,
  fontSize: 13,
  color: Color(0xFF9D9E9B),
);

final signInWithText = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: 'Kanit');

final reviewBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(
      width: 1,
      color: Color(0xFFEDEDED),
    ));

final searchBoder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(
      color: Color(0xFFEDEDED),
    ));

final hintTextStyle = TextStyle(
    color: Color(0xFFCECECE),
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Kanit');

final fieldPadding = EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0);

final currentLoButton = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: yellowColor,
  textStyle: TextStyle(fontSize: 14),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
  ),
  side: BorderSide(
    width: 0.0,
    color: yellowColor,
  ),
);

final chooseMapButton = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: blackColor,
  textStyle: TextStyle(fontSize: 14),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
  ),
  side: BorderSide(
    width: 0.0,
    color: blackColor,
  ),
);

final currentLoText = TextStyle(
    color: Colors.black,
    fontSize: 13,
    fontWeight: FontWeight.bold,
    fontFamily: 'Kanit');

final chooseMapText = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.bold,
    fontFamily: 'Kanit');

final addNewAddrYellowText = TextStyle(
    color: yellowColor,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final addNewAddrBlackText = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Kanit');

final menuTextStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: Color(0xFF494949),
    fontFamily: 'Kanit');

final titleHomeText = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w800,
    fontFamily: 'Kanit');

final dataListTitleText = TextStyle(
    color: Color(0xFF212B32),
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final dataListSubTitleText = TextStyle(
    color: Color(0xFF979797),
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontFamily: 'Kanit');

final resultText = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Kanit');

final menuProfileDecoration = BoxDecoration(
    color: Color(0xFFF6F6F6),
    borderRadius: BorderRadius.all(
      Radius.circular(11),
    ));

final menuProfileText = TextStyle(
    color: Color(0xFF8E8E93),
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: 'Kanit');

final menuRowProfileText = TextStyle(
    color: yellowColor,
    fontSize: 13,
    fontWeight: FontWeight.w800,
    fontFamily: 'Kanit');

final fieldTopUpText = TextStyle(
    color: Color(0xFF333333),
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Kanit');

final payMentText = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final payMentShadow = BoxShadow(
    blurRadius: 8, color: Color.fromRGBO(0, 0, 0, 0.09), spreadRadius: 4);

final bottomInForText = TextStyle(
    decoration: TextDecoration.underline,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFFC98C09),
    fontFamily: 'Kanit');

final bottomTitleText = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: 'Kanit');

final bottomSubTitleText = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: 'Kanit');

final bottomReviewText = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Kanit');

final bottomDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(25),
    ));

final orderReTextBlack = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(0xFF0B0B0B),
    fontFamily: 'Kanit');

final orderReTextPrice = TextStyle(
    decoration: TextDecoration.none,
    color: Color(0xFF189B58),
    fontSize: 14,
    fontWeight: FontWeight.w800,
    fontFamily: 'Kanit');

final orderReTextNum = TextStyle(
    decoration: TextDecoration.none,
    color: Color(0xFFB1ACAC),
    fontSize: 14,
    fontWeight: FontWeight.w800,
    fontFamily: 'Kanit');

final inforTitleText = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFF9D9E9B),
    fontFamily: 'Kanit');

final inforLocaText = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(0xFFAAAAAA),
    fontFamily: 'Kanit');

final totalButton = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: Color(0xFFF4F4F4),
  textStyle: TextStyle(fontSize: 14),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(11.0),
  ),
  side: BorderSide(
    width: 0.0,
    color: Color(0xFFF4F4F4),
  ),
);

final totalText = TextStyle(
    color: yellowColor,
    fontSize: 13,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final priceTotalText = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.w800,
    fontFamily: 'Kanit');

final codePromoText = TextStyle(
    color: Color(0xFF22A876),
    fontSize: 13,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final codePromoOutlined = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: Color(0xFFCEFFCD),
  textStyle: TextStyle(fontSize: 14),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(11.0),
  ),
  side: BorderSide(
    width: 1.0,
    color: Color(0xFF83D79B),
  ),
);

final paymentText = TextStyle(
    color: Color(0xFF323232),
    fontSize: 13,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final paymentOutlined = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: Color(0xFFF4F4F4),
  textStyle: TextStyle(fontSize: 14),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(11.0),
  ),
  side: BorderSide(
    width: 0.0,
    color: Color(0xFFF4F4F4),
  ),
);

final cancelInfor = TextStyle(
    decoration: TextDecoration.underline,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(0xFFD52E2F),
    fontFamily: 'Kanit');

final buttonDelete = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(18.0)),
  color: Color(0xFFEF2C2D),
);

final deleteText = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Kanit');

final notDecoration = BoxDecoration(
  color: Color(0xFFFB6756),
  borderRadius: BorderRadius.circular(10),
);

final notiConstraints = BoxConstraints(
  minWidth: 12,
  minHeight: 12,
);

final fieldSearchBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(17.5)),
    borderSide: BorderSide(color: Color(0xFFEEEEEE)));

final fieldSearchPadding =
    EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0);

final fieldSearchHintText = TextStyle(
    color: Color(0xFF949494),
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Kanit');

final fieldSearchText = TextStyle(
  color: Color(0xFF343434),
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

final timeChatText = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.w500,
  fontFamily: 'Kanit',
  fontSize: 10,
);

final isSendborder = BorderRadius.all(
  Radius.circular(20),
);

final sendborder = BorderRadius.all(
  Radius.circular(20),
);

final dateChatText = TextStyle(
  color: Color(0xFF1A1A1A),
  fontWeight: FontWeight.w400,
  fontFamily: 'Kanit',
  fontSize: 11,
);

final timeChat = TextStyle(
  color: Color(0xFF545353),
  fontWeight: FontWeight.w400,
  fontFamily: 'Kanit',
  fontSize: 11,
);

final readChat = TextStyle(
  color: Color(0xFFE37203),
  fontWeight: FontWeight.w400,
  fontFamily: 'Kanit',
  fontSize: 11,
);

final createProfileText = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontFamily: 'Kanit');

final createProfileBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
    borderSide: BorderSide(color: Color(0xFF5B5B5B)));

final createProfileDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(25),
  border: Border.all(color: Color(0xFF5B5B5B)),
  color: Color(0xFF5B5B5B),
);

final createProfiledropdown = TextStyle(
  color: Color(0xFFCFCFCF),
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

final titleHowUse = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit',
    color: Color(0xFF132150));

final subtitleHowUse = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    fontFamily: 'Kanit',
    color: Color(0xFF333333));

final howuseText = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w600,
    fontFamily: 'Kanit',
    color: Colors.black);

final titleSignOut = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Color(0xFF2F2F2F),
    fontFamily: 'Kanit');

final subtitleSignOut = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Color(0xFF7E7E7E),
    fontFamily: 'Kanit');

final signOutButtonCancel = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: Colors.white,
  textStyle: TextStyle(fontSize: 13),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
  ),
  side: BorderSide(width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.13)),
);

final signOutButtonConfirm = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: Color(0xFF212B32),
  textStyle: TextStyle(fontSize: 13),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
  ),
);

final createProfileHint = TextStyle(
    color: Color(0xFFCFCFCF),
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: 'Kanit');

final createProfileTextStyle = TextStyle(
    color: Color(0xFFFDCD03),
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'Kanit');

final selectTimeText = TextStyle(
    decoration: TextDecoration.none,
    color: blackColor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Kanit');

final selectTimeDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(30),
  ),
);

final selectNow = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(16.0),
    ),
    border: Border.all(
      color: Color(0xFFF2F2F2),
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(202, 202, 202, 0.33),
        spreadRadius: 3,
        blurRadius: 5,
        offset: Offset(0, 4),
      )
    ]);

final slectSchedule = BoxDecoration(
    color: yellowColor,
    borderRadius: const BorderRadius.all(
      Radius.circular(16.0),
    ),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(253, 205, 3, 0.33),
        spreadRadius: 3,
        blurRadius: 5,
        offset: Offset(0, 4),
      )
    ]);

final selectTimeTitle = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: 'Kanit');

final selectsCarButton = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: yellowColor,
  textStyle: TextStyle(fontSize: 14),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
  ),
  side: BorderSide(
    width: 0.0,
    color: yellowColor,
  ),
);

final selectsCarTextButton = TextStyle(
    color: Color(0xFF363636),
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Kanit');

final selectsCarDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(blurRadius: 15, color: Colors.grey[300]!, spreadRadius: 8)
  ],
);

final addAddressText = TextStyle(
    color: Color(0xFF0D3958),
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Kanit');

final dayOfWeekText = TextStyle(
    fontWeight: FontWeight.w400, fontSize: 15, color: Color(0xFF219653));

final calendarText = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF333333));

final articleDiscText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF706F6F),
    fontFamily: 'Kanit');

final orderText = TextStyle(
    color: Color(0xFF949494),
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: 'Kanit');

final cancelOrderText = TextStyle(
    color: Color(0xFFF8772F),
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: 'Kanit');

final titleActivity = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Kanit');

final paymentTextBut = TextStyle(
    color: Colors.white,
    fontSize: 9,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final typeButton = BoxDecoration(
    color: Color(0xFFCEFFCD),
    borderRadius: BorderRadius.all(
      Radius.circular(7),
    ),
    border: Border.all(
      color: Color(0xFF83D79B),
      width: 1,
    ));

final typeText = TextStyle(
    decoration: TextDecoration.underline,
    color: Color(0xFF189B58),
    fontSize: 9,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final typeTText = TextStyle(
    decoration: TextDecoration.underline,
    color: Color(0xFF189B58),
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Kanit');

final poinText = GoogleFonts.inter(
  color: Color(0xFF898A8D),
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

final processButton = BoxDecoration(
    color: Color(0xFFFDCD03),
    borderRadius: BorderRadius.all(
      Radius.circular(7),
    ));

final processText = TextStyle(
    color: Colors.black,
    fontSize: 9,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final sumButtonText = TextStyle(
    color: Color(0xFF22A876),
    fontSize: 9,
    fontWeight: FontWeight.w400,
    fontFamily: 'Kanit');

final paymentButton = BoxDecoration(
    color: Color(0xFF189B58),
    borderRadius: BorderRadius.all(
      Radius.circular(7),
    ));

final paymentButtonText = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final distanceText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFFD79920),
    fontFamily: 'Kanit');

final placeText = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    fontFamily: 'Kanit');

final hideText = TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: 'Kanit');

final titleHide = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    fontFamily: 'Kanit');

final commemtSub = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF747474),
    fontFamily: 'Kanit');

final sumStar = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    fontFamily: 'Kanit');

final subtitleActivity = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: 'Kanit');

final subTitleActivity = TextStyle(
    color: Colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Kanit');

final TitleActivity = TextStyle(
    color: Colors.black,
    fontSize: 19,
    fontWeight: FontWeight.w800,
    fontFamily: 'Kanit');

final myBookSumStar = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Kanit');

final callOutAlertButton = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: blackColor,
  textStyle: TextStyle(fontSize: 14),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0),
  ),
);

final transferText = TextStyle(
    color: Color(0xFF9D9E9B),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Kanit');

final transferSubText = TextStyle(
    color: Color(0xFFD79920),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Kanit');

final weAssisText = TextStyle(
    color: Color(0xFF189B58),
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final weAssisTText = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final checkDetailDecoration = BoxDecoration(
    color: Color(0xFFE8F9E8),
    borderRadius: BorderRadius.all(
      Radius.circular(7),
    ),
    border: Border.all(
      color: Color(0xFFBCDECC),
      width: 1,
    ));

final orderButtonText = TextStyle(
    color: Color(0xFF22A876),
    fontSize: 9,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final orderButtonTText = TextStyle(
    color: Color(0xFF22A876),
    fontSize: 10,
    fontWeight: FontWeight.w800,
    fontFamily: 'Kanit');

final pomotionDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(12),
  ),
  boxShadow: [
    BoxShadow(
        blurRadius: 9, color: Color.fromRGBO(0, 0, 0, 0.09), spreadRadius: 1)
  ],
);

final pomotionSelectedDecoration = BoxDecoration(
  color: Color(0xffCEFFCD),
  borderRadius: BorderRadius.all(
    Radius.circular(12),
  ),
  border: Border.all(width: 1,color: Color(0xff83D79B))
);

final pomotionTitleText = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kanit');

final pomotionSubText =
    TextStyle(color: Color(0xFF545454), fontSize: 10, fontFamily: 'Kanit');

final pomotionCTitleText = TextStyle(
    color: Color(0xFF22A876),
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: 'Kanit');

final pomotionCSubText =
    TextStyle(color: Color(0xFF77BC76), fontSize: 10, fontFamily: 'Kanit');

final pomotionButton = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: Colors.black,
  textStyle: TextStyle(fontSize: 14),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
  ),
  side: BorderSide(
    width: 0.0,
    color: yellowColor,
  ),
);

final pomotionTextButton = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Kanit');

final pomotionBgButton = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(blurRadius: 15, color: Colors.grey[300]!, spreadRadius: 8)
  ],
);

final requestDriverDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(25),
  ),
);

final requestDriverTextHint = TextStyle(
    color: Color(0xFF8A8A8A),
    fontWeight: FontWeight.w500,
    fontSize: 13,
    fontFamily: 'Kanit');

final requestDriverText = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 13,
    fontFamily: 'Kanit');

final requestDriTitleText = TextStyle(
    color: Colors.white,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    fontFamily: 'Kanit');

final requestDriSubTitleText = TextStyle(
    color: Color(0xFFDFDFDF),
    fontSize: 11,
    fontWeight: FontWeight.w300,
    fontFamily: 'Kanit');

final yellowButtonStyle = OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: yellowColor,
  textStyle: TextStyle(fontSize: 14),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
  ),
  side: BorderSide(
    width: 0.0,
    color: yellowColor,
  ),
);

final requestDecoration = BoxDecoration(
    color: Color(0xFF212B32),
    borderRadius: BorderRadius.all(
      Radius.circular(11),
    ));

final confirmLoDecoration = BoxDecoration(
    color: Color(0xFFEEEEEE),
    borderRadius: BorderRadius.all(
      Radius.circular(11),
    ));

final containerDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(blurRadius: 15, color: Colors.grey[300]!, spreadRadius: 8)
  ],
);

final backgroundCouponSelected = BoxDecoration(
  color: Color(0xffCEFFCD),
  borderRadius: BorderRadius.circular(16),
  border: Border.all(color: Color(0xff83D79B), width: 1),
  boxShadow: [payMentShadow],
);

final backgroundCouponDefault = BoxDecoration(
  color: Color(0xffFFFFFF),
  borderRadius: BorderRadius.circular(16),
  border: Border.all(color: Color(0xffFFFFFF), width: 1),
  boxShadow: [payMentShadow],
);
