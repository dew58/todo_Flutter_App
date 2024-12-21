import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/spacing.dart';
import '../../../../core/constans/texts.dart';
import '../../../../core/helper/DND.dart';
import '../../../../core/themes/my_colors.dart';

class Focues extends StatefulWidget {
  const Focues({super.key});

  @override
  State<Focues> createState() => _FocuesState();
}

class _FocuesState extends State<Focues> {
  bool timerFlag = false;
  final CountDownController _controller = CountDownController();

  void openSettings() async {
    await LaunchApp.openApp(
      androidPackageName: 'com.android.settings',
      iosUrlScheme: 'App-Prefs:',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      appBar: AppBar(
        surfaceTintColor: MyColors.mainBackGround,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.mainBackGround,
        title: const Center(
          child: Text(
            Texts.focus,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Scrollable(viewportBuilder: (context, offset) {
          return Column(
            children: [
              Center(
                child: CircularCountDownTimer(
                  duration: 30 * 60,
                  initialDuration: 0,
                  controller: _controller,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  ringColor: Colors.grey.withOpacity(.40),
                  ringGradient: null,
                  fillColor: MyColors.purpel,
                  fillGradient: null,
                  backgroundColor: MyColors.mainBackGround,
                  backgroundGradient: null,
                  strokeWidth: 7.0,
                  strokeCap: StrokeCap.round,
                  textStyle: const TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  textFormat: CountdownTextFormat.MM_SS,
                  isReverse: false,
                  isReverseAnimation: false,
                  isTimerTextShown: true,
                  autoStart: false,
                  onStart: () {
                    debugPrint('Countdown Started');
                  },
                  onComplete: () {
                    debugPrint('Countdown Ended');
                  },
                  onChange: (String timeStamp) {
                    debugPrint('Countdown Changed $timeStamp');
                  },
                  timeFormatterFunction: (defaultFormatterFunction, duration) {
                    if (duration.inSeconds == 0) {
                      return "00:00";
                    } else {
                      return Function.apply(
                          defaultFormatterFunction, [duration]);
                    }
                  },
                ),
              ),
              Text(
                Texts.focusText,
                style: TextStyle(color: Colors.grey, fontSize: 17.sp),
                textAlign: TextAlign.center,
              ),
              verticalSpace(15),
              ElevatedButton(
                onPressed: () async {
                  (timerFlag)
                      ? setState(() async {
                          _controller.pause();
                          await DoNotDisturb.disableDND();
                          timerFlag = false;
                        })
                      :
                      //click to start
                      setState(() async {
                          _controller.start();
                          openSettings();
                          await DoNotDisturb.enableDND();
                          timerFlag = true;
                        });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.purpel,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  timerFlag ? Texts.stopFocus : Texts.startFocus,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
