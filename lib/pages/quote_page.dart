import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/quotes.dart';
import '../widgets/quote_display.dart';
import '../widgets/quote_button.dart';
import '../widgets/curved_app_bar.dart';
import 'saved_quotes_page.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({Key? key}) : super(key: key);

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  final _random = Random();
  int _quoteIndex = 0;
  late List<String> _quotes;
  List<String> _savedQuotes = []; // Kaydedilen özlü sözler listesi

  @override
  void initState() {
    super.initState();
    _quotes = getQuotes();
  }

  void _generateRandomQuote() {
    setState(() {
      _quoteIndex = _random.nextInt(_quotes.length);
    });
  }

  void _handleMenuOption(String option) {
    switch (option) {
      case 'Kaydet':
        _saveQuote();
        break;
      case 'Paylaş':
        _shareQuote();
        break;
      case 'Kaydedilenler':
        _navigateToSavedQuotes();
        break;
      default:
    }
  }

  void _saveQuote() {
    setState(() {
      String quote = _quotes[_quoteIndex];
      if (!_savedQuotes.contains(quote)) {
        _savedQuotes.add(quote);
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Özlü söz kaydedildi'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _shareQuote() {
    // Özlü sözü paylaşma işlemi
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Özlü söz paylaşıldı'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _navigateToSavedQuotes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SavedQuotesPage(savedQuotes: _savedQuotes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CurvedAppBar(), // CurvedAppBar kullanıldı
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QuoteDisplay(quote: _quotes[_quoteIndex]),
                const SizedBox(height: 20),
                QuoteButton(onPressed: _generateRandomQuote),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 150.0,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Center(
                  child: Text(
                    'Menü',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.save),
              title: const Text('Kaydet'),
              onTap: () => _handleMenuOption('Kaydet'),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Paylaş'),
              onTap: () => _handleMenuOption('Paylaş'),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Kaydedilenler'),
              onTap: () => _handleMenuOption('Kaydedilenler'),
            ),
          ],
        ),
      ),
    );
  }
}
