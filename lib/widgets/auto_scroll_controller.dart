import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class AutoScrollerControl extends StatefulWidget {
  final Function onTap;
  final Function(double) onSlideEnd;
  final double initSliderValue;
  final bool pause;

  const AutoScrollerControl({
    Key? key,
    required this.onTap,
    required this.onSlideEnd,
    this.initSliderValue = 70.0,
    required this.pause,
  }) : super(key: key);

  @override
  State<AutoScrollerControl> createState() => _AutoScrollerControlState();
}

class _AutoScrollerControlState extends State<AutoScrollerControl> {
  late double _sliderValue; // = widget.initSliderValue;
  late bool isScrolling;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.initSliderValue;
  }

  @override
  Widget build(BuildContext context) {
    isScrolling = widget.pause;
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 40.0, top: 40.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 3,
                  child: SfRangeSliderTheme(
                    data: SfRangeSliderThemeData(
                      tooltipBackgroundColor: Colors.red[300],
                    ),
                    child: SfSlider.vertical(
                      stepSize: 1.0,
                      min: 0.0,
                      activeColor: IconTheme.of(context).color,
                      inactiveColor:
                          IconTheme.of(context).color?.withOpacity(0.5),
                      max: 100.0,
                      isInversed: true,
                      value: _sliderValue,
                      interval: 20,
                      //showTicks: true,
                      //showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 1,
                      onChangeEnd: (value) {
                        _sliderValue = value;
                        widget.onSlideEnd(value);
                      },
                      onChanged: (dynamic value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: FittedBox(
                      child: FloatingActionButton(
                        backgroundColor:
                            IconTheme.of(context).color?.withOpacity(0.7),
                        child: isScrolling
                            ? const Icon(
                                Icons.pause,
                              )
                            : const Icon(
                                Icons.keyboard_arrow_down,
                              ),
                        onPressed: () {
                          widget.onTap();
                          isScrolling = !isScrolling;
                        },
                        // child: isScrolling
                        //     ? const Icon(
                        //         Icons.pause,
                        //       )
                        //     : const Icon(
                        //         Icons.keyboard_arrow_down,
                        //       ),
                        // onPressed: () {
                        //   widget.onTap();
                        //   isScrolling = !isScrolling;
                        // },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
