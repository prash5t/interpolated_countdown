part of interpolated_countdown;

class ColorsInterpolator {
  Color getInterpolatedColor({
    required int durationRemainingInSecs,
    required int totalDurationInSecs,
    required ColorRangeModel colorRange,
  }) {
    Color interpolatedColor;
    double fraction;

    if (durationRemainingInSecs <= totalDurationInSecs ~/ 2) {
      printLog(
          "after half-time totalD: $totalDurationInSecs remainingD: $durationRemainingInSecs");
      // Interpolating from midColor to lastColor
      fraction = durationRemainingInSecs / (totalDurationInSecs / 2);
      interpolatedColor =
          Color.lerp(colorRange.lastColor, colorRange.midColor, fraction)!;
    } else {
      printLog(
          "before half-time totalD: $totalDurationInSecs remainingD: $durationRemainingInSecs");
      // Interpolating from firstColor to midColor
      fraction = (durationRemainingInSecs - totalDurationInSecs / 2) /
          (totalDurationInSecs / 2);
      interpolatedColor =
          Color.lerp(colorRange.midColor, colorRange.firstColor, fraction)!;
    }
    return interpolatedColor;
  }
}
