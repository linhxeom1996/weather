import 'package:flutter/material.dart';
import 'package:softbase/utils/constains/colors.dart';
import 'package:softbase/utils/constains/dimens.dart';

class TextFieldBase extends StatelessWidget {
  final String? label;
  final String hintText;
  final bool? obscureText;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final String? errorText;
  final bool? onBorder;
  final double? height;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  const TextFieldBase(
      {super.key,
      this.label,
      this.controller,
      required this.hintText,
      this.suffix,
      this.onChanged,
      this.obscureText = false,
      this.errorText,
      this.prefix,
      this.onBorder = true,
      this.height,
      this.focusNode,
      this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null) ...[
          // Text(label!,
          //     style: StyleBase().defaultStyle(
          //         size: 14,
          //         weight: FontWeight.w600,
          //         color: ColorBase.colorF1F)),
        ],
        // const SizedBox(height: 5),
        Container(
          height: height,
          // alignment: Alignment.center,
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            obscureText: obscureText!,
            textAlignVertical: TextAlignVertical.center,
            onEditingComplete: () {
              focusNode?.unfocus();
              onEditingComplete?.call();
            },
            // cursorColor: ColorBase.color373,
            // style: StyleBase().defaultStyle(
            //     size: 14, weight: FontWeight.w400, color: ColorBase.color373),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: ColorApp.black.withOpacity(0.5),
                  fontSize: Dimens.sp14,
                  fontWeight: FontWeight.w400),
              suffixIcon: suffix,
              prefixIcon: prefix,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              focusedBorder: _border(onBorder: onBorder),
              enabledBorder: _border(onBorder: onBorder),
              border: _border(onBorder: onBorder),
              errorText: errorText,
            ),
            onChanged: onChanged,
          ),
        )
      ],
    );
  }

  InputBorder _border({bool? onBorder}) {
    return OutlineInputBorder(
        borderSide: BorderSide(
            color: onBorder == true
                ? ColorApp.colorF1F.withOpacity(0.5)
                : ColorApp.white,
            width: 1),
        borderRadius: BorderRadius.circular(4));
  }
}
