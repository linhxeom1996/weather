import 'package:flutter/widgets.dart';
import 'package:softbase/presentation/widgets/image_widget.dart';
import 'package:softbase/utils/constains/export.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImageWidget(asset: IconApp.ic_loading_op1);
  }
}

class FailedWidget extends StatelessWidget {
  const FailedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImageWidget(asset: IconApp.error_op1);
  }
}
