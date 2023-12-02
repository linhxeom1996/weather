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
          Padding(
            padding: const EdgeInsets.only(bottom: Dimens.sp5),
            child:
                Text(label!, style: Theme.of(context).textTheme.headlineMedium),
          ),
        ],
        SizedBox(
          height: height,
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            obscureText: obscureText!,
            textAlignVertical: TextAlignVertical.center,
            onEditingComplete: () {
              focusNode?.unfocus();
              onEditingComplete?.call();
            },
            cursorColor: ColorApp.black,
            style: Theme.of(context).textTheme.bodyMedium,
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
