import 'package:flutter/material.dart';
import '../models/puzzle.dart';
import '../services/progress_tracker.dart';
import 'puzzle_screen.dart';

class PathScreen extends StatelessWidget {
  final String pathId;
  final String pathTitle;
  final List<Puzzle> allPuzzles;

  const PathScreen({
    required this.pathId,
    required this.pathTitle,
    required this.allPuzzles,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tracker = ProgressTracker();
    final unlockedIds = tracker.getUnlockedPuzzlesForPath(pathId);
    final lastUnlockedId = tracker.getLastUnlocked();

    final unlockedPuzzles = allPuzzles
        .where((p) => p.pathId == pathId && unlockedIds.contains(p.id))
        .toList()
      ..sort((a, b) => a.title.compareTo(b.title));

    return Scaffold(
      appBar: AppBar(
        title: Text(pathTitle),
        backgroundColor: Colors.indigo,
      ),
      body: unlockedPuzzles.isEmpty
          ? Center(
        child: Text(
          'No puzzles unlocked yet.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: unlockedPuzzles.length,
        itemBuilder: (context, index) {
          final puzzle = unlockedPuzzles[index];
          final isNewlyUnlocked = puzzle.id == lastUnlockedId;

          return AnimatedContainer(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeOut,
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isNewlyUnlocked
                  ? Colors.amberAccent.withOpacity(0.15)
                  : Colors.white10,
              border: Border.all(
                color: isNewlyUnlocked ? Colors.amber : Colors.transparent,
                width: isNewlyUnlocked ? 2 : 0,
              ),
              boxShadow: isNewlyUnlocked
                  ? [
                BoxShadow(
                  color: Colors.amber.withOpacity(0.6),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ]
                  : [],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                puzzle.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              subtitle: isNewlyUnlocked
                  ? Text(
                '✨ Newly unlocked!',
                style: TextStyle(color: Colors.amber),
              )
                  : null,
              onTap: () {
                tracker.setLastUnlocked('');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PuzzleScreen(
                      puzzle: puzzle,
                      onSolved: () {
                        Navigator.pop(context); // 👈 Return to capsule
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}