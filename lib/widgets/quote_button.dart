import 'package:flutter/material.dart';

class QuoteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const QuoteButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 235, 54, 4)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        elevation: MaterialStateProperty.all<double>(5),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: const Text(
        "Rastgele Seç",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
