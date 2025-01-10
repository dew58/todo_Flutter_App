import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_dnd/flutter_dnd.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/spacing.dart';
import '../../../../core/constans/texts.dart';
import '../../../../core/themes/my_colors.dart';

class Focues extends StatefulWidget {
  const Focues({super.key});

  @override
  State<Focues> createState() => _FocuesState();
}

class _FocuesState extends State<Focues> {
  bool timerFlag = false;
  final CountDownController _controller = CountDownController();
  bool _isDoNotDisturb = true;

  Future<void> _toggleDoNotDisturb() async {
    if (_isDoNotDisturb) {
      await FlutterDnd.setInterruptionFilter(
          FlutterDnd.INTERRUPTION_FILTER_ALL);
    } else {
      await FlutterDnd.setInterruptionFilter(
          FlutterDnd.INTERRUPTION_FILTER_NONE);
    }
  }

  @override
  void initState() {
    super.initState();
    _requestDoNotDisturbPermission();
    _initializeBackgroundExecution();
  }

  Future<void> _initializeBackgroundExecution() async {
    final androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: "Focues Timer",
      notificationText: "The timer is running in the background",
      notificationImportance: AndroidNotificationImportance.normal,
      notificationIcon:
          AndroidResource(name: 'background_icon', defType: 'drawable'),
    );
    bool hasPermissions = await FlutterBackground.hasPermissions;
    if (!hasPermissions) {
      hasPermissions =
          await FlutterBackground.initialize(androidConfig: androidConfig);
    }
    if (hasPermissions) {
      FlutterBackground.enableBackgroundExecution();
    }
  }

  Future<void> _requestDoNotDisturbPermission() async {
    final isGranted = await FlutterDnd.isNotificationPolicyAccessGranted;
    if (isGranted != null && !isGranted) {
      FlutterDnd.gotoPolicySettings();
    }
  }

  @override
  void dispose() {
    FlutterBackground.disableBackgroundExecution();
    super.dispose();
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
                  setState(() {
                    _isDoNotDisturb = !_isDoNotDisturb;
                  });
                  await _toggleDoNotDisturb();
                  setState(() {
                    if (timerFlag) {
                      _controller.pause();
                    } else {
                      _controller.start();
                    }
                    timerFlag = !timerFlag;
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
