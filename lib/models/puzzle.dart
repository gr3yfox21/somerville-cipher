import 'package:flutter/material.dart';

class Puzzle {
  final String id;
  final String title;
  final String prompt;
  final String route;
  final String imageAsset;
  final String font;
  final bool isUnlocked;
  final String narrativePrompt;
  final Duration? cooldown;
  final List<String>? hints;
  final String? npcGuideId;
  final String answer;
  final List<String> answers;
  final String pathId;
  final String? npcId;

  const Puzzle({
    required this.id,
    required this.title,
    required this.prompt,
    required this.route,
    required this.imageAsset,
    required this.font,
    required this.isUnlocked,
    required this.narrativePrompt,
    this.cooldown,
    this.hints,
    this.npcGuideId,
    required this.answer,
    required this.answers,
    required this.pathId,
    this.npcId});
}