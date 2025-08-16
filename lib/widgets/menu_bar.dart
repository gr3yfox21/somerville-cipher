import 'package:flutter/material.dart';
import '../services/progress_tracker.dart';

class MenuBar extends StatefulWidget implements PreferredSizeWidget {
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
  State<MenuBar> createState() => _MenuBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MenuBarState extends State<MenuBar> {
  final tracker = ProgressTracker();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      title: Text(
        widget.title,
        style: TextStyle(
          fontFamily: widget.font,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: widget.iconColor,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: widget.iconColor),
        tooltip: 'Back',
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.home, color: widget.iconColor),
          tooltip: 'Capsule',
          onPressed: () => Navigator.pushNamed(context, '/capsule'),
        ),
        IconButton(
          icon: Icon(Icons.people, color: widget.iconColor),
          tooltip: 'NPC Archive',
          onPressed: () => Navigator.pushNamed(context, '/npc_archive'),
        ),
        IconButton(
          icon: Icon(Icons.leaderboard, color: widget.iconColor),
          tooltip: 'Leaderboard',
          onPressed: () => Navigator.pushNamed(context, '/leaderboard'),
        ),
        ValueListenableBuilder<int>(
          valueListenable: tracker.pointsNotifier,
          builder: (context, points, _) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Points: $points',
                  style: TextStyle(
                    fontFamily: widget.font,
                    fontSize: 14,
                    color: widget.iconColor.withOpacity(0.85),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.settings, color: widget.iconColor),
          tooltip: 'Settings',
          onPressed: () => Navigator.pushNamed(context, '/settings'),
        ),
      ],
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}