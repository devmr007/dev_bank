// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgrammingButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;
  final double fontSize;
  final double borderRadius;
  final EdgeInsets padding;
  final Widget? icon; // optional icon

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
  });

  @override
  State<ProgrammingButton> createState() => _ProgrammingButtonState();
}

class _ProgrammingButtonState extends State<ProgrammingButton> {
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) => setState(() => isPressed = false),
        onTapCancel: () => setState(() => isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: isPressed
                ? widget.borderColor.withOpacity(0.2)
                : widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: isHovered || isPressed
                  ? widget.borderColor
                  : widget.borderColor.withOpacity(0.7),
              width: 1.5,
            ),
            boxShadow: [
              if (isHovered || isPressed)
                BoxShadow(
                  color: widget.borderColor.withOpacity(0.3),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: const Offset(0, 0),
                ),
            ],
          ),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
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
                  color: widget.textColor,
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
