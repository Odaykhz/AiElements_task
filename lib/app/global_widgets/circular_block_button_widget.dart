import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

const int kCooldownLong_ms = 3000;
const int kCooldownShort_ms = 1200;

class CircularBlockButtonWidget extends StatelessWidget {
  CircularBlockButtonWidget(
      {Key? key,
      @required this.color,
      @required this.text,
      @required this.onPressed,
      this.cooldown,
      this.counter,
      this.cooldownStarted})
      : super(key: key);

  final Color? color;
  final Widget? text;
  final VoidCallback? onPressed;
  int? counter = 0;
  double? cooldown = 0;
  int? cooldownStarted = DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 5),
          ),
          //  BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 13, offset: Offset(0, 0))
        ],
      ),
      child: TapDebouncer(
        cooldown: const Duration(milliseconds: kCooldownShort_ms),
        onTap: () async {
          startCooldownIndicator(kCooldownShort_ms);
          this.onPressed!();
        },
        builder: (_, TapDebouncerFunc? onTap) {
          return MaterialButton(
            elevation: 2.5,
            height: 49,
            onPressed: onTap,
            padding: EdgeInsets.symmetric(
              // horizontal: 65,
              vertical: 14,
            ),
            color: this.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            child: this.text,
          );
        },
      ),
    );
  }

  // void incrementCounter() {
  //   counter++;
  // }

  void startCooldownIndicator(int timeMs) {
    cooldownStarted = DateTime.now().millisecondsSinceEpoch;
    updateCooldown(timeMs);
  }

  void updateCooldown(int timeMs) {
    final int current = DateTime.now().millisecondsSinceEpoch;
    int delta = current - cooldownStarted!;
    if (delta > timeMs) {
      delta = timeMs;
    }
  }
}
