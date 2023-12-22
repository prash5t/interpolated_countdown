part of interpolated_countdown;

class InterpolatedCountDownWidget extends StatefulWidget {
  final CountDownUseCase countdownUseCase;

  const InterpolatedCountDownWidget({
    Key? key,
    required this.countdownUseCase,
  }) : super(key: key);

  @override
  State<InterpolatedCountDownWidget> createState() =>
      _InterpolatedCountDownWidgetState();
}

class _InterpolatedCountDownWidgetState
    extends State<InterpolatedCountDownWidget> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween<double>(begin: 0.95, end: 1).animate(animationController);

    animationController.forward();
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    widget.countdownUseCase.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CountDownUseCase usecase = widget.countdownUseCase;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.scale(
          // FYI: turn off the scaling animation if time remaining reaches zero
          // and stopAnimationAtLast is true
          scale: usecase.stopAnimationAtLast
              ? (usecase.secondsRemaining.value == 0 ? 1 : animation.value)
              : animation.value,
          child: SizedBox(
            width: usecase.diam,
            height: usecase.diam,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PlateWidget(
                  paddingUpToLastPlate: 0,
                  plateShape: usecase.boxShape,
                ),
                // outer Plate widget
                ValueListenableBuilder(
                  valueListenable: usecase.outerPlateColor,
                  builder: (context, updatedColor, child) => PlateWidget(
                    paddingUpToLastPlate: 11,
                    bgColor: updatedColor,
                    plateShape: usecase.boxShape,
                  ),
                ),
                // inner Plate widget
                ValueListenableBuilder(
                  valueListenable: usecase.innerPlateColor,
                  builder: (context, updatedColor, child) => PlateWidget(
                    paddingUpToLastPlate: 32,
                    bgColor: updatedColor,
                    plateShape: usecase.boxShape,
                  ),
                ),
                PlateWidget(
                  paddingUpToLastPlate: 40,
                  plateShape: usecase.boxShape,
                ),
                // remaining time widget
                ValueListenableBuilder(
                  valueListenable: usecase.secondsRemaining,
                  builder: (context, updatedSeconds, child) => Text(
                    updatedSeconds.toString(),
                    style: TextStyle(
                      fontSize: usecase.timeTextSize,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
