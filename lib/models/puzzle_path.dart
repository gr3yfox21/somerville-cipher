import 'package:flutter/material.dart'; // for Color
import 'puzzle.dart'; // for Puzzle


class PuzzlePath {
  final String id;
  final String title;
  final String description;
  final String route;
  final String font;
  final bool isUnlocked;
  final String lore;
  final String imageAsset;
  final String narrativePrompt;
  final Color color;
  final List<Puzzle> puzzles;

  PuzzlePath({
    required this.id,
    required this.title,
    required this.description,
    required this.route,
    required this.font,
    required this.isUnlocked,
    required this.lore,
    required this.imageAsset,
    required this.narrativePrompt,
    required this.color,
    required this.puzzles,
  });
}