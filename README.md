<p align="center">
  <img src="https://i.ibb.co/mSTcwbg/banner.jpg" />
  <h4 align="center">Interpolated Countdown</h3>
  <p align="center">
      Easy to use class to build interpolated countdown widget
  </p>
</p>

<p align="center">
  <!-- <a href="https://github.com/aprashantz/interpolated_countdown/blob/main/LICENSE">
    <img alt="License" src="https://img.shields.io/github/license/aprashantz/interpolated_countdown?label=License" />
  </a> -->
  <a href="https://pub.dev/packages/interpolated_countdown">
    <img alt="Pub version" src="https://img.shields.io/pub/v/interpolated_countdown?color=blue" />
  </a>
  <!--<a href="#contributors">
    <img alt="Contributors" src="https://img.shields.io/github/all-contributors/aprashantz/interpolated_countdown/main" />
  </a>
</p> -->

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  interpolated_countdown: ^1.0.0
```

## Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:interpolated_countdown/interpolated_countdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a CountDownUseCase instance with your configuration
  CountDownUseCase useCase = CountDownUseCase(
  timerTextSize: 55,
  diameter: 204,
  totalDuration: const Duration(seconds: 30),
  stopAnimationOnTimeElapsed: false,
  plateShape: BoxShape.circle,
  outerPlateColorRange: DefaultInterpolationColors.outerPlateColorRange,
  innerPlateColorRange: DefaultInterpolationColors.innerPlateColorRange,
);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Countdown Widget Example'),
        ),
        body: Center(
          child: CountdownWidget(
            countdownUseCase: useCase,
          ),
        ),
      ),
    );
  }
}

```

### CountDownUseCase

The `CountDownUseCase` class is used to manage the countdown logic and plate colors in the interpolated countdown widget. Below are the parameters that can be configured when creating an instance of this class.

#### Parameters

- `timerTextSize` (Type: `double`, Default: `55`): Font size of the timer text.

- `diameter` (Type: `double`, Default: `204`): Diameter of the countdown widget.

- `totalDuration` (Type: `Duration`, Default: `Duration(seconds: 30)`): Total duration of the countdown.

- `stopAnimationOnTimeElapsed` (Type: `bool`, Default: `false`): Whether to stop the animation when time reaches zero.

- `plateShape` (Type: `BoxShape`, Default: `BoxShape.circle`): Shape of the countdown widget plates.

- `callBackOnEverySecondConsumed` (Type: `Function(int secondsConsumed)?`, Default: `null`): A callback function that will be called every second during the countdown. It receives the total seconds consumed as a parameter.

- `outerPlateColorRange` (Type: `ColorRangeModel`, Required): Color range for the outer plate.

- `innerPlateColorRange` (Type: `ColorRangeModel`, Required): Color range for the inner plate.

### Example

```dart
CountDownUseCase useCase = CountDownUseCase(
  timerTextSize: 55,
  diameter: 204,
  totalDuration: Duration(seconds: 30),
  stopAnimationOnTimeElapsed: false,
  plateShape: BoxShape.circle,
  callBackOnEverySecondConsumed: (int secondsConsumed) {
    print('Seconds Consumed: $secondsConsumed');
  },
  outerPlateColorRange: ColorRangeModel(
    firstColor: Colors.green,
    midColor: Colors.yellow,
    lastColor: Colors.red,
  ),
  innerPlateColorRange: ColorRangeModel(
    firstColor: Colors.blue,
    midColor: Colors.purple,
    lastColor: Colors.orange,
  ),
);
```

For more details on the CountDownUseCase class and its methods, refer to the source code.

### GitHub Repo

Visit [https://github.com/aprashantz/interpolated_countdown](https://github.com/aprashantz/interpolated_countdown) to explore more and further customize/contribute as you wish. :)
Danke schön!
