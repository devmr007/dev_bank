// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgrammingButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed; // nullable now
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;
  final double fontSize;
  final double borderRadius;
  final EdgeInsets padding;
  final Widget? icon;
  final bool isEnabled; // new

  const ProgrammingButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = const Color(0xFF00FF66),
    this.borderColor = const Color(0xFF00FF66),
    this.backgroundColor = Colors.transparent,
    this.fontSize = 16,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.icon,
    this.isEnabled = true, // default enabled
  });

  @override
  State<ProgrammingButton> createState() => _ProgrammingButtonState();
}

class _ProgrammingButtonState extends State<ProgrammingButton> {
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    // Colors for disabled state
    final textColor = widget.isEnabled
        ? widget.textColor
        : widget.textColor.withOpacity(0.5);
    final borderColor = widget.isEnabled
        ? widget.borderColor
        : widget.borderColor.withOpacity(0.3);
    final backgroundColor = widget.isEnabled
        ? widget.backgroundColor
        : widget.backgroundColor.withOpacity(0.2);

    return MouseRegion(
      onEnter: (_) {
        if (widget.isEnabled) setState(() => isHovered = true);
      },
      onExit: (_) {
        if (widget.isEnabled) setState(() => isHovered = false);
      },
      child: GestureDetector(
        onTapDown: (_) {
          if (widget.isEnabled) setState(() => isPressed = true);
        },
        onTapUp: (_) {
          if (widget.isEnabled) setState(() => isPressed = false);
        },
        onTapCancel: () {
          if (widget.isEnabled) setState(() => isPressed = false);
        },
        onTap: widget.isEnabled ? widget.onPressed : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: isPressed && widget.isEnabled
                ? borderColor.withOpacity(0.2)
                : backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: isHovered && widget.isEnabled ? borderColor : borderColor,
              width: 1.5,
            ),
            boxShadow: [
              if ((isHovered || isPressed) && widget.isEnabled)
                BoxShadow(
                  color: borderColor.withOpacity(0.3),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: const Offset(0, 0),
                ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                widget.icon!,
                const SizedBox(width: 8),
              ],
              Text(
                widget.text,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: widget.fontSize,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
