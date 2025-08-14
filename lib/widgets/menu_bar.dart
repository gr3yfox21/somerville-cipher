import 'package:flutter/material.dart';
import '../services/progress_tracker.dart';

class MenuBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final String font;
  final Color iconColor;

  const MenuBar({
    required this.title,
    this.backgroundColor = Colors.indigo,
    this.font = 'Roboto',
    this.iconColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final completedCount = ProgressTracker().getCompletedPuzzles().length;

    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: font,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: iconColor,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: iconColor),
        tooltip: 'Back',
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.home, color: iconColor),
          tooltip: 'Capsule',
          onPressed: () => Navigator.pushNamed(context, '/capsule'),
        ),
        IconButton(
          icon: Icon(Icons.people, color: iconColor),
          tooltip: 'NPC Archive',
          onPressed: () => Navigator.pushNamed(context, '/npc_archive'),
        ),
        IconButton(
          icon: Icon(Icons.leaderboard, color: iconColor),
          tooltip: 'Leaderboard',
          onPressed: () => Navigator.pushNamed(context, '/leaderboard'),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Solved: $completedCount',
              style: TextStyle(
                fontFamily: font,
                fontSize: 14,
                color: iconColor.withOpacity(0.85),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.settings, color: iconColor),
          tooltip: 'Settings',
          onPressed: () => Navigator.pushNamed(context, '/settings'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}