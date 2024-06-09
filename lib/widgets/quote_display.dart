import 'package:flutter/material.dart';

class QuoteDisplay extends StatelessWidget {
  final String quote;

  const QuoteDisplay({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FancyContainer(
        color1: Color(0xFF6A1B9A),
        color2: Color(0xFF9C27B0),
        subtitle: quote,
      ),
    );
  }
}

class FancyContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String subtitle;

  const FancyContainer({
    Key? key,
    required this.color1,
    required this.color2,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        subtitle,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
    );
  }
}
