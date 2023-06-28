import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:hw_countdownapp/app/const.dart';
import 'package:hw_countdownapp/widget/button.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'rounded_button.dart';

class CountDownTimerPage extends StatefulWidget {
  const CountDownTimerPage({super.key});

  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => const CountDownTimerPage(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<CountDownTimerPage> {
  final _isHours = true;
  final int _duration = 60;
  final CountDownController _controller = CountDownController();

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(60),
    onChange: (value) => debugPrint('onChange $value'),
    onChangeRawSecond: (value) => debugPrint('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => debugPrint('onChangeRawMinute $value'),
    onStopped: () {},
    onEnded: () {},
  );

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen((value) => debugPrint(
        'rawTimes value ::  $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime
        .listen((value) => debugPrint('Minute value :: $value'));
    _stopWatchTimer.secondTime
        .listen((value) => debugPrint('Second value :: $value'));
    _stopWatchTimer.records
        .listen((value) => debugPrint('Records value :: $value'));
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('CountDown test'),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularCountDownTimer(
                    duration: _duration,
                    initialDuration: 0,
                    controller: _controller,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                    ringColor: Colors.grey[300]!,
                    ringGradient: null,
                    fillColor: Colors.blue[100]!,
                    fillGradient: null,
                    backgroundColor: Color.fromARGB(255, 0, 81, 147),
                    backgroundGradient: null,
                    strokeWidth: 20.0,
                    strokeCap: StrokeCap.round,
                    textStyle: const TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textFormat: CountdownTextFormat.S,
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
                    timeFormatterFunction:
                        (defaultFormatterFunction, duration) {
                      if (duration.inSeconds == 0) {
                        return "Start";
                      } else {
                        return Function.apply(
                            defaultFormatterFunction, [duration]);
                      }
                    },
                  ),
                  StreamBuilder<int>(
                    stream: _stopWatchTimer.rawTime,
                    initialData: _stopWatchTimer.rawTime.value,
                    builder: (context, snap) {
                      final value = snap.data!;
                      final displayTime =
                          StopWatchTimer.getDisplayTime(value, hours: _isHours);
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              padding: EdgeInsets.all(AppConstant.padding),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                displayTime,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 50),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              value.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  StreamBuilder<int>(
                    stream: _stopWatchTimer.secondTime,
                    initialData: _stopWatchTimer.secondTime.value,
                    builder: (context, snap) {
                      final value = snap.data;
                      return Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      'Second',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Helvetica',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Text(
                                      value.toString(),
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: RoundedButton(
                            color: Colors.lightBlue,
                            onTap: () {
                              _stopWatchTimer.onStartTimer();
                              _controller.start();
                            },
                            child: Text(
                              AppConstant.playTimer,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: RoundedButton(
                            color: Colors.green,
                            onTap: () {
                              _stopWatchTimer.onStopTimer();
                              _controller.pause();
                            },
                            child: Text(
                              AppConstant.stopTimer,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: RoundedButton(
                            color: Colors.red,
                            onTap: () {
                              _stopWatchTimer.onResetTimer();
                              _controller.restart(duration: _duration);
                            },
                            child: Text(
                              AppConstant.resetTimer,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
