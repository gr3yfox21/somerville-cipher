import 'package:flutter/material.dart';
import '../models/puzzle.dart';
import '../services/progress_tracker.dart';
import '../models/path.dart';

class PuzzleScreen extends StatefulWidget {
  final Puzzle puzzle;

  const PuzzleScreen({required this.puzzle, Key? key}) : super(key: key);

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  final TextEditingController _controller = TextEditingController();
  String feedback = '';
  bool showHints = false;

  void checkAnswer() {
    final input = _controller.text.trim().toLowerCase();
    final answers = widget.puzzle.answers.map((a) => a.toLowerCase()).toList();

    print('Submitted: "$input"');
    print('Puzzle ID: ${widget.puzzle.id}');
    print('Expected answers: ${answers.join(", ")}');

    final isCorrect = answers.contains(input);

    setState(() {
      feedback = isCorrect ? '✅ Correct!' : '❌ Try again.';
    });

    if (isCorrect) {
      handleCorrectAnswer();
    }
  }

  void handleCorrectAnswer() {
    final puzzleId = widget.puzzle.id;
    final pathId = widget.puzzle.pathId;

    final tracker = ProgressTracker();
    tracker.completePuzzle(puzzleId);
    tracker.incrementPathProgress(pathId);
    tracker.setLastUnlocked(puzzleId);

    final path = puzzlePaths.firstWhere((p) => p.id == pathId);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text('Puzzle Solved!'),
        content: Text('You’ve unlocked new lore.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/path',
                    (route) => false,
                arguments: {
                  'pathId': path.id,
                  'pathTitle': path.title,
                  'allPuzzles': path.puzzles,
                },
              );
            },
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.puzzle;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          p.title,
          style: TextStyle(
            fontFamily: p.font,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(p.imageAsset),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                p.narrativePrompt,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.white60,
                  fontFamily: p.font,
                ),
              ),
              SizedBox(height: 16),
              Text(
                p.prompt,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: p.font,
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your answer...',
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.black26,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: checkAnswer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: Text('Submit'),
              ),
              SizedBox(height: 12),
              Text(
                feedback,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: p.font,
                ),
              ),
              if (p.hints != null && p.hints!.isNotEmpty)
                TextButton(
                  onPressed: () => setState(() => showHints = !showHints),
                  child: Text(
                    showHints ? 'Hide Hints' : 'Show Hints',
                    style: TextStyle(color: Colors.amberAccent),
                  ),
                ),
              if (showHints)
                ...p.hints!.map(
                      (hint) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '💡 $hint',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: p.font,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}