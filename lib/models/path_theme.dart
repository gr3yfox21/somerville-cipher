import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';

class PathTheme {
  final String id;
  final String name;
  final Color color;
  final String fontFamily;
  final String iconAsset; // Optional: for menu or capsule icons
  final String loreTagline; // Optional: short narrative hook

  const PathTheme({
    required this.id,
    required this.name,
    required this.color,
    required this.fontFamily,
    required this.iconAsset,
    required this.loreTagline,
  });
}