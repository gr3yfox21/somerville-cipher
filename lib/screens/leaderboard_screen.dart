import 'package:flutter/material.dart';
import '../widgets/menu_bar.dart' as custom;

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  final List<Map<String, dynamic>> mockLeaderboard = const [
    {'name': 'Elias', 'score': 920, 'title': 'Archivist'},
    {'name': 'Luna', 'score': 870, 'title': 'Pathfinder'},
    {'name': 'Kai', 'score': 840, 'title': 'Echo Whisperer'},
    {'name': 'You', 'score': 790, 'title': 'Puzzle Seeker'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade900, Colors.deepPurple.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: mockLeaderboard.length,
          itemBuilder: (context, index) {
            final entry = mockLeaderboard[index];
            return _buildLeaderboardTile(entry, index);
          },
        ),
      ),
    );
  }

  Widget _buildLeaderboardTile(Map<String, dynamic> entry, int rank) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amberAccent, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            '#${rank + 1}',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'CinzelDecorative',
              color: Colors.amberAccent,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'CormorantGaramond',
                    color: Colors.white,
                  ),
                ),
                Text(
                  entry['title'],
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${entry['score']} pts',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'CormorantGaramond',
            ),
          ),
        ],
      ),
    );
  }
}