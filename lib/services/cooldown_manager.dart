import 'dart:collection';

class CooldownManager {
  static final CooldownManager _instance = CooldownManager._internal();
  factory CooldownManager() => _instance;
  CooldownManager._internal();

  final Map<String, DateTime> _cooldowns = HashMap();

  /// Sets a cooldown for [id] lasting [duration].
  void setCooldown(String id, Duration duration) {
    _cooldowns[id] = DateTime.now().add(duration);
  }

  /// Returns true if the cooldown for [id] is still active.
  bool isOnCooldown(String id) {
    final expiry = _cooldowns[id];
    if (expiry == null) return false;
    return DateTime.now().isBefore(expiry);
  }

  /// Returns the remaining cooldown time for [id], or null if not active.
  Duration? getRemaining(String id) {
    final expiry = _cooldowns[id];
    if (expiry == null) return null;
    final remaining = expiry.difference(DateTime.now());
    return remaining.isNegative ? null : remaining;
  }

  /// Clears the cooldown for [id].
  void clearCooldown(String id) {
    _cooldowns.remove(id);
  }

  /// Clears all cooldowns.
  void resetAll() {
    _cooldowns.clear();
  }
}