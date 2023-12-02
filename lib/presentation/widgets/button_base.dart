import 'package:flutter/material.dart';
import '../../utils/constains/export.dart';

class ButtonBase extends StatelessWidget {
  final String? text;
  final Widget? child;
  final TextStyle? textStyle;
  final Function onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;

  const ButtonBase(
      {super.key,
      this.child,
      this.text,
      required this.onPressed,
      this.backgroundColor,
      this.textStyle,
      this.borderColor,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        onLongPress: () {
          onPressed();
        },
        child: Container(
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: borderColor ?? ColorApp.transparent),
              borderRadius: BorderRadius.circular(25)),
          child: text != null ? Text(text ?? "", style: textStyle) : child,
        ),
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      onLongPress: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
            color: ColorApp.colorF1F.withOpacity(0.08), shape: BoxShape.circle),
        child: const Icon(Icons.arrow_back, color: ColorApp.white),
      ),
    );
  }
}

class RadioButtonWidget extends StatelessWidget {
  const RadioButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(color: ColorApp.color18C), shape: BoxShape.circle),
      child: Container(
        decoration: const BoxDecoration(
            color: ColorApp.color18C, shape: BoxShape.circle),
      ),
    );
  }
}

class TextButtonBase extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Function() onTab;
  const TextButtonBase({super.key, required this.text, this.textStyle, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTab(),
      child: Container(
        color: ColorApp.transparent,
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.sp4, horizontal: Dimens.sp12),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
