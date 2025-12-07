import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgrammingTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final Color borderColor;
  final Color cursorColor;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;

  const ProgrammingTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.borderColor = const Color(0xFF00FF66),
    this.cursorColor = const Color(0xFF00FF66),
    this.textColor = Colors.white,
    this.backgroundColor = const Color(0xFF0A0F14),
    this.fontSize = 16,
  });

  @override
  State<ProgrammingTextField> createState() => _ProgrammingTextFieldState();
}

class _ProgrammingTextFieldState extends State<ProgrammingTextField> {
  bool showBlink = true;
  bool obscure = true;
  Timer? blinkTimer;

  @override
  void initState() {
    super.initState();
    obscure = widget.isPassword;

    /// Blink effect
    blinkTimer = Timer.periodic(const Duration(milliseconds: 900), (timer) {
      if (mounted) {
        setState(() => showBlink = !showBlink);
      }
    });
  }

  @override
  void dispose() {
    blinkTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasText = widget.controller.text.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LABEL
        Text(
          "> ${widget.label}:",
          style: GoogleFonts.jetBrainsMono(
            color: widget.borderColor,
            fontSize: widget.fontSize - 2,
          ),
        ),
        const SizedBox(height: 6),

        /// INPUT BOX
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: widget.borderColor, width: 1.4),
            boxShadow: [
              BoxShadow(
                color: widget.borderColor.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Stack(
            children: [
              /// REAL TEXTFIELD
              TextField(
                controller: widget.controller,
                obscureText: obscure,
                keyboardType: widget.keyboardType,
                cursorColor: Colors.green,
                // showCursor: false,
                // cursorWidth: 5,
                cursorOpacityAnimates: false,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: widget.fontSize,
                  color: widget.textColor,
                ),
                decoration: const InputDecoration(
                  isCollapsed: true,
                  border: InputBorder.none,
                ),
                onChanged: (_) {
                  setState(() {}); // update cursor position
                },
              ),

              /// FAKE TERMINAL CURSOR (only if text exists)
              if (hasText)
                Positioned(
                  left: _textWidth(widget.controller.text),
                  top: 0,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: showBlink ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 150),
                    child: Text(
                      "_",
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: widget.fontSize,
                        color: widget.cursorColor,
                      ),
                    ),
                  ),
                ),

              /// PASSWORD EYE ICON
              if (widget.isPassword)
                Positioned(
                  right: 4,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () => setState(() => obscure = !obscure),
                      child: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility,
                        color: widget.borderColor,
                        size: 22,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  /// Measure text length in pixels to position cursor correctly
  double _textWidth(String text) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: GoogleFonts.jetBrainsMono(
          fontSize: widget.fontSize,
          color: widget.textColor,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return painter.width + 4; // small offset
  }
}
