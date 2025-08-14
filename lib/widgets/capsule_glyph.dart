class CapsuleGlyph extends StatelessWidget {
  final PuzzlePath path;

  const CapsuleGlyph({required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        gradient: path.isUnlocked
            ? LinearGradient(colors: [Colors.teal, Colors.greenAccent])
            : LinearGradient(colors: [Colors.grey.shade800, Colors.black]),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: path.isUnlocked ? Colors.white : Colors.grey,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          path.title,
          style: TextStyle(
            fontFamily: path.font,
            fontSize: 16,
            color: path.isUnlocked ? Colors.white : Colors.grey.shade400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}