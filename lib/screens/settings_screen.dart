import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool soundOn = true;
  String theme = 'Mystic';
  double textScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade900, Colors.indigo.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildToggleTile(
              title: 'Sound Effects',
              value: soundOn,
              onChanged: (val) => setState(() => soundOn = val),
              icon: Icons.volume_up,
            ),
            _buildDropdownTile(
              title: 'Theme',
              value: theme,
              options: ['Light', 'Dark', 'Mystic'],
              onChanged: (val) {
                if (val != null) {
                  setState(() => theme = val);
                }
              },

              icon: Icons.palette,
            ),
            _buildSliderTile(
              title: 'Text Size',
              value: textScale,
              min: 0.8,
              max: 1.5,
              onChanged: (val) => setState(() => textScale = val),
              icon: Icons.text_fields,
            ),
            Divider(color: Colors.white54),
            ListTile(
              leading: Icon(Icons.info_outline, color: Colors.white),
              title: Text(
                'View Credits & Lore',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pushNamed(context, '/credits'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData icon,
  }) {
    return SwitchListTile(
      title: Text(title, style: TextStyle(color: Colors.white)),
      value: value,
      onChanged: onChanged,
      secondary: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildDropdownTile({
    required String title,
    required String value,
    required List<String> options,
    required void Function(String?) onChanged, // ← updated here
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      trailing: DropdownButton<String>(
        value: value,
        dropdownColor: Colors.indigo.shade800,
        style: TextStyle(color: Colors.white),
        items: options.map((opt) => DropdownMenuItem(
          value: opt,
          child: Text(opt),
        )).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildSliderTile({
    required String title,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Slider(
        value: value,
        min: min,
        max: max,
        divisions: 7,
        label: value.toStringAsFixed(2),
        onChanged: onChanged,
      ),
    );
  }
}