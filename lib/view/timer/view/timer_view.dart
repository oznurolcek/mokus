import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proje/core/extensions/context_extension.dart';
import 'package:proje/core/init/lang/locale_keys.g.dart';

import '../../../core/constants/image/image_constants.dart';

class TimerView extends StatefulWidget {
  TimerView({Key? key}) : super(key: key);

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  static const countdownDuration = Duration(minutes: 25);
  Duration duration = Duration();
  Timer? timer;
  static const maxSeconds = 1500;
  int seconds1 = maxSeconds;
  bool? _myTemp;

  bool isCountdown = true;

  @override
  void initState() {
    _myTemp=false;
    super.initState();

    reset();
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        setState(() {
          _myTemp=false;
        });
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer({bool resets = true}) {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: context.screenHeight * 0.25,
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: seconds1 / maxSeconds,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    strokeWidth: 10,
                    backgroundColor: context.colors.secondary,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: context.colors.primary,
                    ),
                  ),
                  Center(
                    child: Lottie.asset(
                      ImageConstants.instance.sandClock,
                      animate: _myTemp,
                      height: context.screenHeight * 0.3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            buildTime(),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }

  OutlinedButton buildButton() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      child: isRunning
          ? Text(
              LocaleKeys.timer_giveup.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100,
              ),
            )
          : Text(
              LocaleKeys.timer_startfocus.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100,
              ),
            ),
      onPressed: () {
        if (isRunning) {
          setState(() {
            _myTemp=false;
          });
          stopTimer();
        } else {
          setState(() {
            _myTemp=true;
          });
          startTimer(resets: false);
        }
      },
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      "$minutes:$seconds",
      style: const TextStyle(
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.w100,
      ),
    );
  }
}
