import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

import '../data/path_data.dart'; // your full list of paths
import '../models/puzzle.dart'; // for screens and services
import '../models/puzzle_path.dart'; // for screens/services

class ProgressTracker {
  static final ProgressTracker _instance = ProgressTracker._internal();
  factory ProgressTracker() => _instance;
  ProgressTracker._internal() {
    _loadPoints();
  }

  // ✅ Reactive point tracking
  final ValueNotifier<int> pointsNotifier = ValueNotifier<int>(0);

  // ✅ Internal state
  final Set<String> _completedPuzzles = HashSet();
  final Map<String, int> _pathProgress = HashMap();
  final Map<String, String> _puzzlePathMap = {};
  String? _lastUnlockedPuzzleId;

  // ✅ Load points from persistent storage
  Future<void> _loadPoints() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getInt('points') ?? 0;
    pointsNotifier.value = stored;
    print('🔄 Loaded points: ${pointsNotifier.value}');
  }

  // ✅ Save points to persistent storage
  Future<void> _savePoints() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('points', pointsNotifier.value);
    print('💾 Saved points: ${pointsNotifier.value}');
  }

  // ✅ Award a point and persist
  void awardPoint() {
    pointsNotifier.value += 1;
    _savePoints();
    print('🎯 Point awarded! Total: ${pointsNotifier.value}');
  }

  int getPoints() => pointsNotifier.value;

  // ✅ Puzzle tracking
  void registerPuzzle(String puzzleId, String pathId) {
    _puzzlePathMap[puzzleId] = pathId;
  }

  void completePuzzle(String puzzleId) {
    _completedPuzzles.add(puzzleId);
  }

  bool isPuzzleCompleted(String puzzleId) {
    return _completedPuzzles.contains(puzzleId);
  }

  Set<String> getCompletedPuzzles() => _completedPuzzles;

  // ✅ Unlock tracking
  void setLastUnlocked(String puzzleId) {
    _lastUnlockedPuzzleId = puzzleId;
  }

  String? getLastUnlocked() => _lastUnlockedPuzzleId;

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

  // ✅ Return unlocked paths for capsule screen
  List<PuzzlePath> getUnlockedPaths(List<PuzzlePath> puzzlePaths) {
    return allPaths.where((path) {
      final unlockedCount = getUnlockedPuzzlesForPath(path.id).length;
      return unlockedCount > 0;
    }).toList();
  }

  // ✅ Reset all progress
  Future<void> resetProgress() async {
    _completedPuzzles.clear();
    _pathProgress.clear();
    _puzzlePathMap.clear();
    _lastUnlockedPuzzleId = null;
    pointsNotifier.value = 0;
    await _savePoints();
    print('🧹 Progress reset');
  }
}