import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hw_countdownapp/app/const.dart';
import 'package:hw_countdownapp/widget/button.dart';

class ManualStopWatchTimerPage extends StatefulWidget {
  const ManualStopWatchTimerPage({super.key});

  @override
  State<ManualStopWatchTimerPage> createState() =>
      _ManualStopWatchTimerPageState();
}

class _ManualStopWatchTimerPageState extends State<ManualStopWatchTimerPage> {
  static const countdownDuration = Duration(minutes: 100);
  Duration duration = const Duration();
  Timer? timer;
  bool countDown = true;

  @override
  void initState() {
    super.initState();
    resetTime();
  }

  void resetTime() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = const Duration());
    }
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resetsTime = true}) {
    if (resetsTime) {
      resetTime();
    }
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text("Let's Countdown the time!"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTime(),
            const SizedBox(
              height: 80,
            ),
            buildButtons()
          ],
        ),
      ),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours, header: 'HOURS'),
      const SizedBox(
        width: 8,
      ),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      const SizedBox(
        width: 8,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(AppConstant.padding),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(header, style: const TextStyle(color: Colors.black45)),
        ],
      );

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;
    return isRunning || isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonWidget(
                text: AppConstant.stopTimer,
                onClicked: () {
                  if (isRunning) {
                    stopTimer(resetsTime: false);
                  }
                },
                icon: const Icon(
                  Icons.stop,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              buttonWidget(
                  text: AppConstant.resetTimer,
                  onClicked: stopTimer,
                  icon: const Icon(Icons.cancel)),
            ],
          )
        : Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonWidget(
                  text: AppConstant.playTimer,
                  color: Colors.black,
                  backgroundColor: Colors.white,
                  onClicked: () {
                    startTimer();
                  },
                  icon: Icon(
                    Icons.start,
                    color: Colors.black,
                    size: AppConstant.iconSize,
                  ),
                ),
              ],
            ),
          );
  }
}
