import 'dart:async';
import 'package:dev_bank/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypingText extends StatefulWidget {
  final List<String> words; // words to type in loop
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Duration typingSpeed;
  final Duration pauseDuration; // pause before deleting/typing next word

  const TypingText({
    super.key,
    required this.words,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.typingSpeed = const Duration(milliseconds: 150),
    this.pauseDuration = const Duration(milliseconds: 1000),
  });

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  String _currentText = '';
  int _wordIndex = 0;
  int _charIndex = 0;
  bool _isDeleting = false;
  Timer? _timer;
  bool _showCursor = true;

  @override
  void initState() {
    super.initState();

    // blinking cursor timer
    Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (mounted) setState(() => _showCursor = !_showCursor);
    });

    // typing timer
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.typingSpeed, (timer) {
      final word = widget.words[_wordIndex];
      if (!_isDeleting) {
        // typing
        if (_charIndex < word.length) {
          setState(() {
            _charIndex++;
            _currentText = word.substring(0, _charIndex);
          });
        } else {
          // pause before deleting
          Future.delayed(widget.pauseDuration, () {
            _isDeleting = true;
          });
        }
      } else {
        // deleting
        if (_charIndex > 0) {
          setState(() {
            _charIndex--;
            _currentText = word.substring(0, _charIndex);
          });
        } else {
          // move to next word
          _isDeleting = false;
          _wordIndex = (_wordIndex + 1) % widget.words.length;
        }
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
        text: _currentText,
        style: TextStyle(
          fontSize: widget.fontSize?.sp ?? 16.sp,
          fontWeight: widget.fontWeight,
          color: widget.textColor ?? Colors.white,
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
