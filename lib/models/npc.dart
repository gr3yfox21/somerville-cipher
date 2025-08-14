class NPC {
  final String id;               // Unique identifier
  final String name;             // Display name
  final String title;            // Narrative title (e.g. "The Historian")
  final String role;             // Functional role in gameplay
  final String vibe;             // Personality description
  final String clueStyle;        // How they deliver hints
  final String specialFeature;   // Unique mechanic or unlock condition
  final String portraitAsset;    // Path to avatar image
  final List<String> dialogue;   // Optional voice lines or quotes

  const NPC({
    required this.id,
    required this.name,
    required this.title,
    required this.role,
    required this.vibe,
    required this.clueStyle,
    required this.specialFeature,
    required this.portraitAsset,
    required this.dialogue,
  });
}