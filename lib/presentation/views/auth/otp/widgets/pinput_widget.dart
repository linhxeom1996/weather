import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pinput/pinput.dart';
import 'package:softbase/presentation/widgets/button_base.dart';

import '../../../../../utils/constains/export.dart';

class PinputWidget extends StatefulWidget {
  const PinputWidget({super.key});

  @override
  State<PinputWidget> createState() => _PinputWidgetState();
}

class _PinputWidgetState extends State<PinputWidget> {
  int _timeCount = 60;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    countDownTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Dimens.spacing30, bottom: Dimens.spacing20),
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          Pinput(
            length: 6,
            defaultPinTheme: const PinTheme(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: ColorApp.transparent,
                border: Border(
                  bottom: BorderSide(
                    color: ColorApp.color18C,
                    width: Dimens.spacing2,
                  ),
                ),
              ),
            ),
            onChanged: (value) {},
            showCursor: false,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: Dimens.spacing15, bottom: Dimens.spacing5),
            child: Text("Chưa nhận được mã OTP?",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          TextButtonBase(
              text: _timeCount == 0
                  ? "Gửi lại mã"
                  : "Gửi lại sau: 0:${_timeCount}s",
              textStyle: Theme.of(context).textTheme.bodyMedium,
              onTab: () {
                if (_timeCount == 0) {
                  _timeCount = 60;
                  countDownTime();
                }
              })
        ],
      ),
    );
  }

  countDownTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeCount == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _timeCount--;
        });
      }
    });
  }
}
