import 'package:flutter/material.dart';
import '../widgets/puzzle_card.dart';
import '../widgets/menu_bar.dart' as custom;

class PathDetailScreen extends StatelessWidget {
  final String pathId;
  final String title;
  final String description;
  final Color startColor;
  final Color endColor;
  final String font;
  final List<Map<String, dynamic>> puzzles;

  const PathDetailScreen({
    required this.pathId,
    required this.title,
    required this.description,
    required this.startColor,
    required this.endColor,
    required this.font,
    required this.puzzles,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custom.MenuBar(
        title: title,
        backgroundColor: startColor,
        font: font,
        iconColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                fontFamily: font,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: puzzles.isEmpty
                  ? Center(
                child: Text(
                  'No puzzles available for this path.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white54,
                    fontFamily: font,
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: puzzles.length,
                itemBuilder: (context, index) {
                  final puzzle = puzzles[index];
                  return PuzzleCard(
                    title: puzzle['title'] ?? 'Untitled',
                    description: puzzle['description'] ?? '',
                    routeName: puzzle['route'] ?? '/',
                    startColor: startColor,
                    endColor: endColor,
                    imageAsset: puzzle['image'] ?? '',
                    font: font,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}