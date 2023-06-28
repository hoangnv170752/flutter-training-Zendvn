import 'package:flutter/material.dart';
import 'package:hw_countdownapp/pages/components/count_page.dart';

class PackagePage extends StatelessWidget {
  const PackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text("Streamer Builder using for"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 4),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       foregroundColor: Colors.pinkAccent,
            //       padding: const EdgeInsets.all(4),
            //       shape: const StadiumBorder(),
            //     ),
            //     onPressed: () {
            //       // CountUpTimerPage.navigatorPush(context);
            //     },
            //     child: const Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 16),
            //       child: Text(
            //         'Go To CountUpTimer',
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.pinkAccent,
                  padding: const EdgeInsets.all(4),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  CountDownTimerPage.navigatorPush(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Count down timer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
