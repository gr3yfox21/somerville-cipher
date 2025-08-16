import '../models/puzzle.dart';
import 'package:flutter/material.dart';

List<Puzzle> generatePathPuzzles(
    String pathId,
    String font,
    String route,
    String npcId,
    List<Map<String, dynamic>> rawPuzzles,
    ) {
  return rawPuzzles.map<Puzzle>((data) {
    final title = data['title'] as String;
    final answers = List<String>.from(data['answers']);
    final id = '${pathId}_${title.toLowerCase().replaceAll(RegExp(r'\s+'), '_')}';
    final imageAsset = 'assets/images/${pathId}_${title.toLowerCase().replaceAll(RegExp(r'\s+'), '_')}.png';

    return Puzzle(
      id: id,
      title: title,
      prompt: data['prompt'] as String,
      route: route,
      imageAsset: imageAsset,
      font: font,
      isUnlocked: false,
      narrativePrompt: 'Solve the puzzle to reveal the next clue.',
      cooldown: null,
      hints: null,
      npcGuideId: null,
      answer: answers.first,
      answers: answers,
      pathId: pathId,
      npcId: npcId,
    );
  }).toList();
}