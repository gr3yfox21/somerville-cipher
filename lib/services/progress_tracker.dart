import 'dart:collection';

class ProgressTracker {
  static final ProgressTracker _instance = ProgressTracker._internal();
  factory ProgressTracker() => _instance;
  ProgressTracker._internal();

  final Set<String> _completedPuzzles = HashSet(); // ✅ Use Set for uniqueness
  final Map<String, int> _pathProgress = HashMap(); // ✅ Tracks # solved per path
  final Map<String, String> _puzzlePathMap = {};    // ✅ puzzleId → pathId
  String? _lastUnlockedPuzzleId;

  // ✅ Register puzzle-to-path relationship
  void registerPuzzle(String puzzleId, String pathId) {
    _puzzlePathMap[puzzleId] = pathId;
  }

  // ✅ Mark puzzle as completed
  void completePuzzle(String puzzleId) {
    _completedPuzzles.add(puzzleId);
  }

  // ✅ Check if puzzle is completed
  bool isPuzzleCompleted(String puzzleId) {
    return _completedPuzzles.contains(puzzleId);
  }

  // ✅ Get all completed puzzle IDs
  Set<String> getCompletedPuzzles() => _completedPuzzles;

  // ✅ Track last unlocked puzzle
  void setLastUnlocked(String puzzleId) {
    _lastUnlockedPuzzleId = puzzleId;
  }

  String? getLastUnlocked() => _lastUnlockedPuzzleId;

  // ✅ Get unlocked puzzles for a given path
  List<String> getUnlockedPuzzlesForPath(String pathId) {
    return _completedPuzzles
        .where((puzzleId) => _puzzlePathMap[puzzleId] == pathId)
        .toList();
  }

  // ✅ Path progress tracking
  void setPathProgress(String pathId, int count) {
    _pathProgress[pathId] = count;
  }

  void incrementPathProgress(String pathId) {
    _pathProgress.update(pathId, (value) => value + 1, ifAbsent: () => 1);
  }

  int getPathProgress(String pathId) {
    return _pathProgress[pathId] ?? 0;
  }

  // ✅ Reset all progress
  void resetProgress() {
    _completedPuzzles.clear();
    _pathProgress.clear();
    _puzzlePathMap.clear();
    _lastUnlockedPuzzleId = null;
  }
}