import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'puzzle.dart';

class PuzzlePath {
  final String id;
  final String title;
  final String route;
  final String description;
  final String font;
  final bool isUnlocked;
  final String lore;
  final String narrativePrompt;
  final String imageAsset;
  final Color color;
  final List<Puzzle> puzzles;

  PuzzlePath({
    required this.id,
    required this.title,
    required this.description,
    required this.route,
    required this.font,
    required this.isUnlocked,
    required this.lore,
    required this.imageAsset,
    required this.narrativePrompt,
    required this.color,
    required this.puzzles,
  });
}

Puzzle createPuzzle({
  required String pathId,
  required int index,
  required String title,
  required String prompt,
  required String font,
  required String npcId,
}) {
  final id = '${pathId}_${index + 1}';
  return Puzzle(
    id: id,
    title: title,
    prompt: prompt,
    answer: 'answer${index + 1}',
    answers: ['answer${index + 1}', 'alt answer ${index + 1}'],
    route: '/$id',
    imageAsset: 'assets/images/$id.png',
    font: font,
    isUnlocked: index == 0,
    narrativePrompt: 'Clue hidden in $title...',
    hints: ['Hint 1 for $title', 'Hint 2 for $title'],
    npcGuideId: npcId,
    cooldown: Duration(seconds: 0),
    pathId: pathId,
  );
}

List<Puzzle> generatePathPuzzles(String pathId, String font, String npcId, List<Map<String, String>> data) {
  return List.generate(data.length, (i) {
    return createPuzzle(
      pathId: pathId,
      index: i,
      title: data[i]['title']!,
      prompt: data[i]['prompt']!,
      font: font,
      npcId: npcId,
    );
  });
}

final List<PuzzlePath> puzzlePaths = [
PuzzlePath(
id: 'colonial_echoes',
title: 'Colonial Echoes',
description: 'Revolutionary War puzzle arc.',
route: '/colonial_echoes',
font: 'CrimsonText',
isUnlocked: true,
lore: 'Revolutionary whispers echo through Somerville’s founding soil.',
imageAsset: 'assets/images/colonial_1.png',
narrativePrompt: 'The past speaks in riddles. Can you hear it?',
color: AppColors.colonialEchoes,
puzzles: generatePathPuzzles('colonial_echoes', 'CrimsonText', 'npc_historian', [
{'title': 'Departure Manifest', 'prompt': 'What year was the gear statue dedicated?'},
{'title': 'Wallace Winter Orders', 'prompt': 'What was Georges Secret?'},
{'title': 'Cannon’s Silence', 'prompt': 'What’s etched beneath the old artillery?'},
{'title': 'Saint Johns Love', 'prompt': 'stained stones?'},
{'title': 'Hidden Dispatch', 'prompt': 'Decode the cipher found in the cellar.'},
{'title': 'Liberty Bell Replica', 'prompt': 'What inscription is missing from the plaque?'},
{'title': 'The Forgotten Regiment', 'prompt': 'Which unit trained in Somerville?'},
{'title': 'Final Salute', 'prompt': 'What symbol marks the veteran’s memorial?'},
]),
),
PuzzlePath(
id: 'industrial_trail',
title: 'Industrial Trail',
description: 'Railroads, clayworks, early commerce.',
route: '/industrial_trail',
font: 'RobotoMono',
isUnlocked: false,
lore: 'Railroads and clayworks shaped the town’s early pulse.',
imageAsset: 'assets/images/industrial_trail.png',
narrativePrompt: 'The hum of progress hides forgotten clues.',
color: AppColors.industrialTrail,
puzzles: generatePathPuzzles('industrial_trail', 'RobotoMono', 'npc_engineer', [
{'title': 'Trackline Cipher', 'prompt': 'What number is stamped on the final rail?'},
{'title': 'Clay Kiln Code', 'prompt': 'What shape repeats in the kiln mural?'},
{'title': 'Factory Whistle', 'prompt': 'What time did the shift begin?'},
{'title': 'Merchant’s Ledger', 'prompt': 'What item sold most in 1892?'},
{'title': 'Steam Junction', 'prompt': 'Which valve controls the pressure?'},
{'title': 'Iron Echo', 'prompt': 'What’s carved into the foundry gate?'},
{'title': 'Warehouse Riddle', 'prompt': 'What symbol marks the oldest crate?'},
{'title': 'Final Manifest', 'prompt': 'What destination is listed last?'},
]),
),
PuzzlePath(
id: 'victorian_secrets',
title: 'Victorian Secrets',
description: 'Architecture, art, coded symbols.',
route: '/victorian_secrets',
font: 'PlayfairDisplay',
isUnlocked: false,
lore: 'Victorian flourishes conceal cryptic messages.',
imageAsset: 'assets/images/victorian_secrets.png',
narrativePrompt: 'Decode the embellishments. They speak in symbols.',
color: AppColors.victorianSecrets,
puzzles: generatePathPuzzles('victorian_secrets', 'PlayfairDisplay', 'npc_architect', [
{'title': 'Gable Glyphs', 'prompt': 'What symbol repeats on the rooftop trim?'},
{'title': 'Stained Truths', 'prompt': 'Which color dominates the window’s story?'},
{'title': 'Column Code', 'prompt': 'How many fluted columns stand at Town Hall?'},
{'title': 'Archway Cipher', 'prompt': 'What’s hidden in the keystone carving?'},
{'title': 'Balcony Riddle', 'prompt': 'Which motif decorates the ironwork?'},
{'title': 'Mural Mystery', 'prompt': 'What object is missing from the painting?'},
{'title': 'Doorframe Enigma', 'prompt': 'What number is etched in the lintel?'},
{'title': 'Final Ornament', 'prompt': 'What creature guards the cornice?'},
]),
),
PuzzlePath(
id: 'civic_whispers',
title: 'Civic Whispers',
description: 'Clues tied to town governance, hidden in public records.',
route: '/civic_whispers',
font: 'Lora',
isUnlocked: false,
lore: 'The town’s bureaucracy hides messages in plain sight.',
imageAsset: 'assets/images/civic_whispers.png',
narrativePrompt: 'What do the records say when read between the lines?',
color: AppColors.civicWhispers,
puzzles: generatePathPuzzles('civic_whispers', 'Lora', 'npc_clerk', [
{'title': 'Charter Code', 'prompt': 'What year was Somerville incorporated?'},
{'title': 'Council Cipher', 'prompt': 'Which ordinance number banned lanterns?'},
{'title': 'Registry Riddle', 'prompt': 'What name repeats in the 1901 census?'},
{'title': 'Budget Breakdown', 'prompt': 'What item cost the most in 1920?'},
{'title': 'Seal Secrets', 'prompt': 'What animal appears on the town seal?'},
{'title': 'Ballot Box', 'prompt': 'What symbol marked the winning party?'},
{'title': 'Meeting Minutes', 'prompt': 'What phrase was struck from the record?'},
{'title': 'Final Filing', 'prompt': 'What document ends the archive?'},
]),
),
  PuzzlePath(
    id: 'green_enigma',
    title: 'Green Enigma',
    description: 'Park-based puzzles, urban nature + sustainability lore.',
    route: '/green_enigma',
    font: 'Merriweather',
    isUnlocked: false,
    lore: 'Nature’s secrets bloom in silence.',
    imageAsset: 'assets/images/green_enigma.png',
    narrativePrompt: 'Listen to the leaves. They whisper truths.',
    color: AppColors.greenEnigma,
    puzzles: generatePathPuzzles('green_enigma', 'Merriweather', 'npc_naturalist', [
      {'title': 'Leafline Riddle', 'prompt': 'Which tree species lines the eastern trail?'},
      {'title': 'Pollinator Puzzle', 'prompt': 'What flower attracts the most bees?'},
      {'title': 'Eco Echo', 'prompt': 'What phrase is carved into the solar bench?'},
      {'title': 'Stream Cipher', 'prompt': 'What object floats near the footbridge?'},
      {'title': 'Compost Code', 'prompt': 'What symbol marks the green bin?'},
      {'title': 'Garden Glyphs', 'prompt': 'Which herb is planted in the center bed?'},
      {'title': 'Trail Marker', 'prompt': 'What color marks the sustainability loop?'},
      {'title': 'Final Bloom', 'prompt': 'What plant blooms last in the season?'},
    ]),
  ),
  PuzzlePath(
    id: 'flavor_fugue',
    title: 'Flavor Fugue',
    description: 'Restaurant-driven puzzles tied to taste, menus, sensory cues.',
    route: '/flavor_fugue',
    font: 'DancingScript',
    isUnlocked: false,
    lore: 'Every bite tells a story.',
    imageAsset: 'assets/images/flavor_fugue.png',
    narrativePrompt: 'Taste the clues. Decode the flavor.',
    color: AppColors.flavorFugue,
    puzzles: generatePathPuzzles('flavor_fugue', 'DancingScript', 'npc_chef', [
      {'title': 'Menu Cipher', 'prompt': 'What dish is marked with a star?'},
      {'title': 'Spice Riddle', 'prompt': 'Which spice is listed first?'},
      {'title': 'Flavor Trail', 'prompt': 'What ingredient appears in all entrees?'},
      {'title': 'Table Code', 'prompt': 'What number is etched into the tabletop?'},
      {'title': 'Chef’s Signature', 'prompt': 'What symbol marks the chef’s favorite?'},
      {'title': 'Dessert Enigma', 'prompt': 'What flavor is hidden in the mousse?'},
      {'title': 'Drink Puzzle', 'prompt': 'Which cocktail shares its name with a song?'},
      {'title': 'Final Bite', 'prompt': 'What garnish tops the farewell dish?'},
    ]),
  ),
  PuzzlePath(
    id: 'ghostline',
    title: 'Ghostline',
    description: 'Paranormal experiences based on Somerville lore and local stories.',
    route: '/ghostline',
    font: 'Spectral',
    isUnlocked: false,
    lore: 'Some tales never rest.',
    imageAsset: 'assets/images/ghostline.png',
    narrativePrompt: 'The spirits speak in riddles.',
    color: AppColors.ghostline,
    puzzles: generatePathPuzzles('ghostline', 'Spectral', 'npc_medium', [
      {'title': 'Phantom Footsteps', 'prompt': 'What sound echoes in the alley at dusk?'},
      {'title': 'Lantern Lore', 'prompt': 'What color glows in the haunted window?'},
      {'title': 'Graveyard Glyphs', 'prompt': 'What symbol marks the oldest stone?'},
      {'title': 'Whispering Wall', 'prompt': 'What phrase is heard at midnight?'},
      {'title': 'Specter’s Path', 'prompt': 'Which route does the ghost retrace?'},
      {'title': 'Mirror Mystery', 'prompt': 'What reflection appears uninvited?'},
      {'title': 'Seance Cipher', 'prompt': 'What word was spelled during the ritual?'},
      {'title': 'Final Haunting', 'prompt': 'What object moves on its own?'},
    ]),
  ),
  PuzzlePath(
    id: 'merchants_code',
    title: 'The Merchant’s Code',
    description: 'Symbolic wares, local maker histories, and the coded culture of commerce.',
    route: '/merchants_code',
    font: 'Ubuntu',
    isUnlocked: false,
    lore: 'Commerce carries hidden meaning in every transaction.',
    imageAsset: 'assets/images/merchants_code.png',
    narrativePrompt: 'Decode the storefronts. Read the signs.',
    color: AppColors.merchantsCode,
    puzzles: generatePathPuzzles('merchants_code', 'Ubuntu', 'npc_merchant', [
      {'title': 'Ledger Cipher', 'prompt': 'What item is listed with a triangle symbol?'},
      {'title': 'Window Display', 'prompt': 'Which object repeats in every storefront?'},
      {'title': 'Receipt Riddle', 'prompt': 'What number appears on all receipts?'},
      {'title': 'Signage Secrets', 'prompt': 'What color marks the artisan shops?'},
      {'title': 'Inventory Code', 'prompt': 'Which item is marked “rare”?'},
      {'title': 'Trade Token', 'prompt': 'What symbol is stamped on the coin?'},
      {'title': 'Market Map', 'prompt': 'What shape outlines the vendor stalls?'},
      {'title': 'Final Transaction', 'prompt': 'What phrase ends the merchant’s ledger?'},
    ]),
  ),
];