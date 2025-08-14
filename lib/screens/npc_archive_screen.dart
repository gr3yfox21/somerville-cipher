import 'package:flutter/material.dart';

class NPCArchiveScreen extends StatelessWidget {
  const NPCArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NPC Archive')),
      body: Center(child: Text('Browse NPC lore and hints')),
    );
  }
}

Widget _buildSpecialFeature(String featureKey) {
  switch (featureKey) {
    case 'archive':
      return ElevatedButton(
        onPressed: () {
          // Elias: consult archive logic
        },
        child: Text('Consult the Archive'),
      );
    case 'gear_mod':
      return ElevatedButton(
        onPressed: () {
          // Maizy: modify clue logic
        },
        child: Text('Modify Clue'),
      );
    case 'duo_game':
      return ElevatedButton(
        onPressed: () {
          // Bishop & Clover: launch mini-game
        },
        child: Text('Start Rival Mini-Game'),
      );
    case 'sensory_vault':
      return ElevatedButton(
        onPressed: () {
          // Madame Roux: unlock spice vault
        },
        child: Text('Unlock Sensory Vault'),
      );
    case 'capsule_trigger':
      return ElevatedButton(
        onPressed: () {
          // The Curator: trigger capsule logic
        },
        child: Text('Trigger Capsule Encounter'),
      );
    default:
      return SizedBox.shrink();
  }
}