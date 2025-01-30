import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:softbase/core/constants/export.dart';

class PinputWidget extends StatefulWidget {
  final Function(String) onDone;
  final Function() timeOutPressed;
  final Function() timeOutListener;
  final TextEditingController? controller;
  const PinputWidget(
      {super.key,
      required this.onDone,
      required this.timeOutPressed,
      required this.timeOutListener,
      this.controller});

  @override
  State<PinputWidget> createState() => _PinputWidgetState();
}

class _PinputWidgetState extends State<PinputWidget> {
  int _timeCount = 60;
  late Timer _timer;
  bool changePinTimeOut = false;

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
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          Pinput(
            length: 6,
            controller: widget.controller,
            defaultPinTheme: PinTheme(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: ColorApp.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: changePinTimeOut ? ColorApp.red : ColorApp.black,
                    width: 1),
              ),
            ),
            onChanged: (value) {
              if (_timeCount != 0) {
                widget.onDone(value);
              } else {
                setState(() {
                  changePinTimeOut = true;
                });
              }
            },
            showCursor: false,
          ),
          TextButton(
            onPressed: () {
              if (_timeCount == 0) {
                _timeCount = 60;
                widget.timeOutPressed();
                countDownTime();
              }
            },
            child: RichText(
                text: TextSpan(children: [
              if (_timeCount != 0) ...[
                TextSpan(
                    text: "Mã OTP hết hạn sau ",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        color: ColorApp.black,
                        fontWeight: FontWeight.w400)),
                TextSpan(
                    text: "${_timeCount}s",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        color: ColorApp.black,
                        fontWeight: FontWeight.w700))
              ] else ...[
                TextSpan(
                    text: "Bạn không nhận được mã? ",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        color: ColorApp.black,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: "Gửi lại",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        color: ColorApp.black,
                        fontWeight: FontWeight.w600))
              ]
            ])),
          )
        ],
      ),
    );
  }

  countDownTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeCount == 0) {
        widget.timeOutListener();
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          changePinTimeOut = false;
          _timeCount--;
        });
      }
    });
  }
}
