import 'package:flutter/material.dart';
import 'package:softbase/utils/constains/export.dart';

class DividerBase extends StatelessWidget {
  final double? indent;
  final double? endIndent;
  const DividerBase({super.key, this.endIndent, this.indent});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorApp.black.withOpacity(0.5),
      height: Dimens.spacing2,
      thickness: 0.5,
      indent: indent ?? 0,
      endIndent: endIndent ?? 0,
    );
  }
}
