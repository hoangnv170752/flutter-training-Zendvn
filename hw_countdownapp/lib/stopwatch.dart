import 'package:flutter/material.dart';
import 'package:hw_countdownapp/pages/components/count_page.dart';
import 'package:hw_countdownapp/pages/manual_page.dart';
import 'package:hw_countdownapp/pages/package_page.dart';

class StopWatchTimerButton extends StatefulWidget {
  const StopWatchTimerButton({Key? key}) : super(key: key);

  @override
  State<StopWatchTimerButton> createState() => _StopWatchTimerButtonState();
}

class _StopWatchTimerButtonState extends State<StopWatchTimerButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade900,
        title: const Text("Choose your timer"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ManualStopWatchTimerPage()));
                },
                child: const Text("Not using library - Manual")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CountDownTimerPage()));
                },
                child: const Text("Using stopwatch library")),
          ],
        ),
      ),
    );
  }
}
