class PathPage extends StatelessWidget {
  final PuzzlePath path;

  const PathPage({required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(path.title)),
      body: ListView.builder(
        itemCount: path.puzzles.length,
        itemBuilder: (context, index) {
          final puzzle = path.puzzles[index];
          return PuzzleCard(puzzle: puzzle); // Your custom widget
        },
      ),
    );
  }
}