part of interpolated_countdown;

/// Represents a color range for the plate in a countdown widget.
class ColorRangeModel {
  final Color firstColor;
  final Color midColor;
  final Color lastColor;

  /// Creates a ColorRangeModel with the specified colors.
  ColorRangeModel({
    required this.firstColor,
    required this.midColor,
    required this.lastColor,
  });
}
