import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/capsule_screen.dart';
import 'screens/leaderboard_screen.dart';
import 'screens/npc_archive_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/puzzle_screen.dart';
import 'screens/path_detail_screen.dart';
import 'screens/path_screen.dart'; // ✅ Your dynamic path screen
import 'models/path.dart'; // for PuzzlePath and puzzlePaths
import 'services/answer_validator.dart';
import 'models/puzzle.dart';

void checkAnswer(String playerInput, Puzzle puzzle) {
  final isCorrect = isCorrectAnswer(playerInput, puzzle.answers);

  if (isCorrect) {
    print('✅ Correct!');
  } else {
    print('❌ Try again.');
  }
}

void main() {
  runApp(SomervilleCipherApp());
}

class SomervilleCipherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Somerville Cipher',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        // 🌟 Core Screens
        '/': (context) => WelcomeScreen(),
        '/capsule': (context) => CapsuleScreen(paths: puzzlePaths),
        '/leaderboard': (context) => LeaderboardScreen(),
        '/npc_archive': (context) => NPCArchiveScreen(),
        '/settings': (context) => SettingsScreen(),

        // 🧩 First Puzzle Screens
        for (var path in puzzlePaths)
          if (path.puzzles.isNotEmpty)
            path.puzzles.first.route: (context) =>
                PuzzleScreen(puzzle: path.puzzles.first),

        // 🧭 Path Detail Screens
        for (var path in puzzlePaths)
          path.route: (context) => buildPathDetailScreen(path),

        // ✨ Dynamic Path Puzzle List Screen
        '/path': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return PathScreen(
            pathId: args['pathId'],
            pathTitle: args['pathTitle'],
            allPuzzles: args['allPuzzles'],
          );
        },
      },
    );
  }
}

/// Helper to build a themed PathDetailScreen from a PuzzlePath
Widget buildPathDetailScreen(PuzzlePath path) {
  return PathDetailScreen(
    pathId: path.id,
    title: path.title,
    description: path.description,
    startColor: path.color.withOpacity(0.9),
    endColor: path.color.withOpacity(0.6),
    font: path.font,
    puzzles: path.puzzles.map((puzzle) => {
      'title': puzzle.title,
      'description': puzzle.narrativePrompt,
      'route': puzzle.route,
      'image': puzzle.imageAsset,
    }).toList(),
  );
}