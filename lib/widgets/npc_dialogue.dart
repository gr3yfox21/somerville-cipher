import 'package:flutter/material.dart';

class NPCDialogue extends StatefulWidget {
  final String npcName;
  final List<String> dialogueLines;
  final String? portraitAsset;
  final VoidCallback? onComplete;

  const NPCDialogue({
    required this.npcName,
    required this.dialogueLines,
    this.portraitAsset,
    this.onComplete,
    super.key,
  });

  @override
  State<NPCDialogue> createState() => _NPCDialogueState();
}

class _NPCDialogueState extends State<NPCDialogue> {
  int currentLine = 0;

  void _nextLine() {
    if (currentLine < widget.dialogueLines.length - 1) {
      setState(() {
        currentLine++;
      });
    } else {
      widget.onComplete?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        border: Border.all(color: Colors.amber, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.portraitAsset != null)
            CircleAvatar(
              backgroundImage: AssetImage(widget.portraitAsset!),
              radius: 32,
            ),
          SizedBox(height: 8),
          Text(
            widget.npcName,
            style: TextStyle(
              fontFamily: 'CinzelDecorative',
              fontSize: 20,
              color: Colors.amberAccent,
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.dialogueLines[currentLine],
            style: TextStyle(
              fontFamily: 'CormorantGaramond',
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: _nextLine,
            child: Text(currentLine < widget.dialogueLines.length - 1 ? 'Next' : 'Close'),
          ),
        ],
      ),
    );
  }
}