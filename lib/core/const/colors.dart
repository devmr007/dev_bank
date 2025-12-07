import 'package:flutter/material.dart';

class AppColors {
  // Terminal background
  static const Color terminalBG = Color(0xFF0A0F14); // Dark terminal
  static const Color terminalBG2 = Color(0xFF0D131C); // Slightly lighter

  // Syntax colors
  static const Color red = Color(0xFFFF3B30); // Error / keyword
  static const Color cyan = Color(0xFF00E5FF); // Keywords / variables
  static const Color green = Color(0xFF00FF66); // Cursor / success
  static const Color yellow = Color(0xFFFFD60A); // Numbers / literals
  static const Color magenta = Color(0xFFFF2D55); // Strings / constants
  static const Color white = Color(0xFFFFFFFF); // Plain text
  static const Color gray = Color(0xFF8E8E93); // Comments / muted

  // Neon / glow effects
  static const Color neonCyan = Color(0xFF00FFFF);
  static const Color neonGreen = Color(0xFF39FF14);

  // Accent colors
  static const Color cyanAccent = Color(0xFF00FFFF);
  static const Color purpleAccent = Color(0xFFBF00FF);

  // Button / UI accents
  static const Color buttonBG = Color(0xFF011627);
  static const Color buttonText = Color(0xFF00FF66);

  // Form fields
  static const Color textFieldBG = Color(0xFF0F1824);
  static const Color textFieldBorder = Color(0xFF00FF66);

  // Shadow/glow
  static const Color shadowGreen = Color(0x2600FF66); // semi-transparent
  static const Color shadowCyan = Color(0x2600FFFF);
}
