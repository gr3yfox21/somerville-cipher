import 'package:flutter/material.dart';

class PuzzleCard extends StatelessWidget {
  final String title;
  final String description;
  final String routeName;
  final String imageAsset;
  final Color startColor;
  final Color endColor;
  final String font;

  const PuzzleCard({
    required this.title,
    required this.description,
    required this.routeName,
    required this.imageAsset,
    required this.startColor,
    required this.endColor,
    required this.font,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: endColor.withOpacity(0.4),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: font,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  fontFamily: font,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}