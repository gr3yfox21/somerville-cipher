import 'package:flutter/material.dart';
import '../models/path.dart'; // for PuzzlePath
import '../widgets/menu_bar.dart' as custom;

class CapsuleScreen extends StatelessWidget {
  final List<PuzzlePath> paths;

  const CapsuleScreen({required this.paths, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custom.MenuBar(
        title: 'Capsule Hub',
        backgroundColor: Colors.deepPurple.shade700,
        font: 'PlayfairDisplay',
        iconColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: paths.length,
        itemBuilder: (context, index) {
          final path = paths[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: path.color.withOpacity(0.85),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: path.color.withOpacity(0.4),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                path.title,
                style: TextStyle(
                  fontFamily: path.font,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    path.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      fontFamily: path.font,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    path.narrativePrompt,
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.white60,
                      fontFamily: path.font,
                    ),
                  ),
                ],
              ),
              trailing: Icon(
                path.isUnlocked ? Icons.lock_open : Icons.lock_outline,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pushNamed(context, path.route);
              },
            ),
          );
        },
      ),
    );
  }
}