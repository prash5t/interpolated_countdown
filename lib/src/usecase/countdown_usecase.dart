part of interpolated_countdown;

class CountdownUseCase {
  late ValueNotifier<int> secondsRemaining;
  late ValueNotifier<Color> outerPlateColor;
  late ValueNotifier<Color> innerPlateColor;
  late double diam;
  late bool stopAnimationAtLast;
  late Timer timer;
  late double timeTextSize;
  late BoxShape boxShape;

  ColorsInterpolator utils = ColorsInterpolator();

  CountdownUseCase({
    double timerTextSize = 55,
    double diameter = 204,
    Duration totalDuration = const Duration(seconds: 30),
    bool stopAnimationOnTimeElapsed = false,
    BoxShape plateShape = BoxShape.circle,
    Function(int secondsConsumed)? callBackOnEverySecondConsumed,
    required ColorRangeModel outerPlateColorRange,
    required ColorRangeModel innerPlateColorRange,
  }) {
    _initializePlateColorsAndRemainingDuration(
      totalDuration,
      outerPlateColorRange,
      innerPlateColorRange,
      diameter,
      stopAnimationOnTimeElapsed,
      timerTextSize,
      plateShape,
    );
    _initiateTimeCountdown(
      outerPlateColorRange,
      innerPlateColorRange,
      totalDuration,
      callBackOnEverySecondConsumed,
    );
  }

  void _initiateTimeCountdown(
    ColorRangeModel outerPlateColorRange,
    ColorRangeModel innerPlateColorRange,
    Duration totalDuration,
    Function(int secondsConsumed)? callBackOnEverySecondConsumed,
  ) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;

        outerPlateColor.value = utils.getInterpolatedColor(
          durationRemainingInSecs: secondsRemaining.value,
          totalDurationInSecs: totalDuration.inSeconds,
          colorRange: outerPlateColorRange,
        );

        innerPlateColor.value = utils.getInterpolatedColor(
          durationRemainingInSecs: secondsRemaining.value,
          totalDurationInSecs: totalDuration.inSeconds,
          colorRange: innerPlateColorRange,
        );

        // trigger time spent callback
        if (callBackOnEverySecondConsumed != null) {
          int timeSpent = totalDuration.inSeconds - secondsRemaining.value;
          callBackOnEverySecondConsumed(timeSpent);
        }
      }
    });
  }

  void _initializePlateColorsAndRemainingDuration(
    Duration totalDuration,
    ColorRangeModel outerPlateColorRange,
    ColorRangeModel innerPlateColorRange,
    double diameter,
    bool stopAnimationOnTimeElapsed,
    double timerTextSize,
    BoxShape plateShape,
  ) {
    secondsRemaining = ValueNotifier<int>(totalDuration.inSeconds);
    outerPlateColor = ValueNotifier<Color>(outerPlateColorRange.firstColor);
    innerPlateColor = ValueNotifier<Color>(innerPlateColorRange.firstColor);
    diam = diameter;
    stopAnimationAtLast = stopAnimationOnTimeElapsed;
    timeTextSize = timerTextSize;
    boxShape = plateShape;
  }

  void dispose() {
    timer.cancel();
  }
}
