import 'package:flutter/material.dart';
import 'package:interpolated_countdown/interpolated_countdown.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    CountDownUseCase useCase = CountDownUseCase(
      callBackOnEverySecondConsumed: (secondsConsumed) {
        printLog("Time Spent: $secondsConsumed secs (from callback receiver)");
      },
      outerPlateColorRange:
          DefaultInterpolationColorsRange.outerRingDefaultColorRange,
      innerPlateColorRange:
          DefaultInterpolationColorsRange.innerRingDefaultColorRange,
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Countdown Widget Example'),
        ),
        body: Center(
          child: InterpolatedCountDownWidget(countdownUseCase: useCase),
        ),
      ),
    );
  }
}
