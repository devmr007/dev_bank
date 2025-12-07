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

  const BlinkingText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.blinkSpeed = const Duration(milliseconds: 900),
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
    _timer = Timer.periodic(widget.blinkSpeed, (_) {
      if (mounted) {
        setState(() => _showCursor = !_showCursor);
      }
    });
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
          TextSpan(
            text: _showCursor ? '_' : ' ',
            style: TextStyle(color: AppColors.green),
          ),
        ],
      ),
    );
  }
}
