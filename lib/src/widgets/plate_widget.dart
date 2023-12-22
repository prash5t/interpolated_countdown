part of interpolated_countdown;

class PlateWidget extends StatelessWidget {
  final double paddingUpToLastPlate;
  final double borderWidth;
  final Color bgColor;
  final Color borderColor;
  final BoxShape plateShape;

  const PlateWidget({
    Key? key,
    required this.paddingUpToLastPlate,
    required this.plateShape,
    this.bgColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 3.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingUpToLastPlate),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          shape: plateShape,
          color: bgColor,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
    );
  }
}
