import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:todo/constans/my_colors.dart';

class Focues extends StatefulWidget {
  const Focues({super.key});

  @override
  State<Focues> createState() => _FocuesState();
}

class _FocuesState extends State<Focues> {
  bool timerFlag = false;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Focus Mode",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Scrollable(viewportBuilder: (context, offset) {
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
                backgroundColor: Colors.black,
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
                    return Function.apply(defaultFormatterFunction, [duration]);
                  }
                },
              ),
            ),
            const Text(
              "While your focus mode is on, all of your\nnotifications will be off",
              style: TextStyle(color: Colors.grey, fontSize: 17),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                (timerFlag)
                    ?
                    //click to end

                    setState(() {
                        _controller.pause();
                        timerFlag = false;
                      })
                    :
                    //click to start
                    setState(() {
                        _controller.start();
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
                timerFlag ? "Stop Focusing" : "Start Focusing",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      }),
    );
  }
}
