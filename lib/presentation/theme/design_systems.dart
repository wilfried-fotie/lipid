import 'package:flutter/material.dart';

Color kPrimaryColorOne = const Color(0xff9B6F52);
Color kPrimaryColorTwo = const Color(0xff706255);
Color kPrimaryColorThree = const Color(0xff4E4B66);
Color kPrimaryColorFor = const Color(0xffCA976A);

Color kGreyOne = const Color(0xff8D9091);
Color kGreyTwo = const Color(0xffCCCCCC);
Color kGreyThree = const Color(0xffEFEFEF);
Color kBg = const Color(0xffF7F7FC);
Color kGreyFor = const Color(0xffFBFBFB);
Color kPrimaryGrey = const Color(0xff1B2124);
Color kAltOne = const Color(0xffFFFCD1);
Color kSecondaryRed = const Color(0xffC5292A);
Color kAltThree = const Color(0xffFFD965);
Color kAltFor = const Color(0xffBDB76B);
Color kAltFive = const Color(0xff22B02E);

// Shadows

BoxShadow kShadowOne = const BoxShadow(
    color: Color(0x05000000), offset: Offset(0, 25), blurRadius: 5);

BoxShadow kShadowTwo = const BoxShadow(
    color: Color(0x03000000), offset: Offset(0, 25), blurRadius: 5);

BoxShadow kShadowThree = const BoxShadow(
    color: Color(0x30000000), offset: Offset(0, 2), blurRadius: 5);

// Text

TextStyle ktextLarge = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w400,
  letterSpacing: .7,
  fontSize: 20,
);

TextStyle ktextMedium = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w400,
  letterSpacing: .7,
  fontSize: 20,
);

TextStyle ktextSmall = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w400,
  letterSpacing: .7,
  fontSize: 16,
);

TextStyle ktextxSmall = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w400,
  letterSpacing: .7,
  fontSize: 13,
  height: 2,
);

TextStyle kLinkLarge = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w600,
  letterSpacing: .7,
  fontSize: 20,
);

TextStyle kLinkMedium = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w600,
  letterSpacing: .7,
  fontSize: 16,
);

TextStyle kLinkSmall = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w600,
  letterSpacing: .7,
  fontSize: 14,
);

TextStyle kLinkXSmall = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  fontSize: 13,
);

TextStyle kDisplayLarge = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w400,
  letterSpacing: 1,
  fontSize: 48,
);

TextStyle kDisplayMedium = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w400,
  letterSpacing: 1,
  fontSize: 32,
);

TextStyle kDisplaySmall = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w800,
  letterSpacing: 1,
  fontSize: 48,
);

TextStyle kDisplayMediumBold = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w800,
  letterSpacing: 1,
  fontSize: 32,
);

TextStyle kDisplaySmallBold = const TextStyle(
  fontFamily: "montserrat",
  fontWeight: FontWeight.w800,
  letterSpacing: 1,
  fontSize: 24,
);

// TextStyles

InputDecoration input = InputDecoration(
  contentPadding: const EdgeInsets.all(16),
  filled: true,
  fillColor: kGreyThree,
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kGreyOne.withAlpha(50), width: .5),
    borderRadius: BorderRadius.circular(4.0),
  ),
  hoverColor: kPrimaryColorOne,
  enabled: true,
  labelStyle: kLinkMedium.copyWith(fontSize: 12, color: kGreyOne),
  floatingLabelStyle:
      MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
    if (states.contains(MaterialState.focused)) {
      return ktextMedium.copyWith(fontSize: 12, color: kPrimaryColorOne);
    }
    if (states.contains(MaterialState.error)) {
      return ktextMedium.copyWith(fontSize: 12, color: kSecondaryRed);
    }
    return kLinkMedium.copyWith(fontSize: 12, color: Colors.black);
  }),
  helperStyle: ktextMedium.copyWith(fontSize: 12, color: kGreyOne),
  errorStyle: kLinkXSmall.copyWith(
      fontSize: 12, fontWeight: FontWeight.w500, color: kSecondaryRed),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSecondaryRed, width: .5),
    borderRadius: BorderRadius.circular(4.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColorOne, width: .5),
    borderRadius: BorderRadius.circular(4.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kGreyTwo.withOpacity(.3), width: 1),
    borderRadius: BorderRadius.circular(4.0),
  ),
);

Switch customSwitch(bool sw, Function(bool)? func) {
  return Switch(
    value: sw,
    onChanged: func,
    activeColor: kPrimaryColorOne,
    inactiveTrackColor: kGreyTwo,
    inactiveThumbColor: kGreyOne,
    activeTrackColor: kGreyTwo,
  );
}
