import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/modules/global_widgets/ui.dart';

import '../../common/color_utils.dart';
import 'font_style_util.dart';
import 'sizes_box.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.onSaved,
    required this.onChanged,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.initialValue = "",
    this.hintText = "",
    required this.labelText,
    this.obscureText = false,
    this.suffixIcon = const Icon(Icons.remove_red_eye),
    this.isFirst = false,
    this.isLast = false,
    required this.style,
    this.textAlign = TextAlign.start,
    this.suffix = false,
  }) : super(key: key);

  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final String initialValue;
  final String hintText;
  final TextAlign textAlign;
  final String labelText;
  final TextStyle style;
  final bool obscureText;
  final bool isFirst;
  final bool isLast;
  final Widget suffixIcon;
  final bool suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: FontStyleUtilities.f14(
              fontColor: ColorUtilities.colorPrimary, fontWeight: FWT.regular),
        ),
        hSizedBox1,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(
              left: 0, right: 0, top: topMargin, bottom: bottomMargin),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Get.theme.primaryColor, width: 1.5)),
          child: TextFormField(
            keyboardType: keyboardType,
            onSaved: onSaved,
            onChanged: onChanged,
            validator: validator,
            initialValue: initialValue,
            style: FontStyleUtilities.f14(
              fontColor: ColorUtilities.colorBlack,
              fontWeight: FWT.regular,
            ),
            obscureText: obscureText,
            textAlign: textAlign,
            decoration: Ui.getInputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              suffix: suffix,
            ),
          ),
        ),
      ],
    );
  }

  BorderRadius get buildBorderRadius {
    if (isFirst) {
      return const BorderRadius.vertical(top: Radius.circular(10));
    }
    if (isLast) {
      return const BorderRadius.vertical(bottom: Radius.circular(10));
    }
    if (!isFirst && !isLast) {
      return const BorderRadius.all(Radius.circular(0));
    }
    return const BorderRadius.all(Radius.circular(10));
  }

  double get topMargin {
    if ((isFirst)) {
      return 10;
      // ignore: unnecessary_null_comparison
    } else if (isFirst == null) {
      return 10;
    } else {
      return 0;
    }
  }

  double get bottomMargin {
    if ((isLast)) {
      return 10;
      // ignore: unnecessary_null_comparison
    } else if (isLast == null) {
      return 10;
    } else {
      return 0;
    }
  }
}

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
    required this.onSaved,
    required this.onChanged,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.initialValue = "",
    this.hintText = "",
    required this.labelText,
    this.obscureText = false,
    this.enable = false,
    this.suffixIcon = const Icon(Icons.remove_red_eye),
    this.isFirst = false,
    this.isLast = false,
    required this.style,
    this.textAlign = TextAlign.start,
    this.suffix = false,
  }) : super(key: key);

  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final String initialValue;
  final String hintText;
  final TextAlign textAlign;
  final String labelText;
  final TextStyle style;
  final bool obscureText;
  final bool isFirst;
  final bool isLast;
  final Widget suffixIcon;
  final bool suffix;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.25,
      padding: const EdgeInsets.only(left: 20, right: 10),
      margin: EdgeInsets.only(
          left: 0, right: 0, top: topMargin, bottom: bottomMargin),
      decoration: BoxDecoration(
        color: ColorUtilities.kLightGreyColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
        enabled: enable,
        initialValue: initialValue,
        style: FontStyleUtilities.f14(
          fontColor: ColorUtilities.colorBlack,
          fontWeight: FWT.regular,
        ),
        obscureText: obscureText,
        textAlign: textAlign,
        decoration: Ui.getSearchDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          suffix: suffix,
        ),
      ),
    );
  }

  BorderRadius get buildBorderRadius {
    if (isFirst) {
      return const BorderRadius.vertical(top: Radius.circular(10));
    }
    if (isLast) {
      return const BorderRadius.vertical(bottom: Radius.circular(10));
    }
    if (!isFirst && !isLast) {
      return const BorderRadius.all(Radius.circular(0));
    }
    return const BorderRadius.all(Radius.circular(10));
  }

  double get topMargin {
    if ((isFirst)) {
      return 10;
      // ignore: unnecessary_null_comparison
    } else if (isFirst == null) {
      return 10;
    } else {
      return 0;
    }
  }

  double get bottomMargin {
    if ((isLast)) {
      return 10;
      // ignore: unnecessary_null_comparison
    } else if (isLast == null) {
      return 10;
    } else {
      return 0;
    }
  }
}
