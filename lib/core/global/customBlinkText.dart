import 'dart:async';
import 'package:dev_bank/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlinkingText extends StatefulWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Duration blinkSpeed;
  final bool hideCursor; // hide cursor completely
  final bool blinkCursor; // blink cursor if true

  const BlinkingText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.blinkSpeed = const Duration(milliseconds: 900),
    this.hideCursor = false,
    this.blinkCursor = true,
  });

  @override
  State<BlinkingText> createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<BlinkingText> {
  bool _showCursor = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Only blink if blinkCursor is true and cursor is not hidden
    if (widget.blinkCursor && !widget.hideCursor) {
      _timer = Timer.periodic(widget.blinkSpeed, (_) {
        if (mounted) setState(() => _showCursor = !_showCursor);
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: widget.text,
        style: TextStyle(
          fontSize: widget.fontSize?.sp ?? 16.sp,
          fontWeight: widget.fontWeight,
          color: widget.textColor,
        ),
        children: [
          if (!widget.hideCursor)
            TextSpan(
              text: widget.blinkCursor ? (_showCursor ? '_' : ' ') : '_',
              style: TextStyle(color: AppColors.green),
            ),
        ],
      ),
    );
  }
}
