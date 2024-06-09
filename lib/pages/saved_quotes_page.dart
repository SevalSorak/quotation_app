import 'package:flutter/material.dart';

class SavedQuotesPage extends StatefulWidget {
  final List<String> savedQuotes;

  const SavedQuotesPage({Key? key, required this.savedQuotes}) : super(key: key);

  @override
  _SavedQuotesPageState createState() => _SavedQuotesPageState();
}

class _SavedQuotesPageState extends State<SavedQuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaydedilen Özlü Sözler'),
      ),
      body: ListView.builder(
        itemCount: widget.savedQuotes.length,
        itemBuilder: (context, index) {
          return _buildListItem(widget.savedQuotes[index]);
        },
      ),
    );
  }

  Widget _buildListItem(String quote) {
    return ListTile(
      title: Text(quote),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          _showDeleteDialog(quote);
        },
      ),
    );
  }

  void _showDeleteDialog(String quote) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Özlü Sözü Sil'),
          content: Text('Bu özlü sözü silmek istediğinizden emin misiniz?'),
          actions: <Widget>[
            TextButton(
              child: Text('Iptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sil'),
              onPressed: () {
                _deleteQuote(quote);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteQuote(String quote) {
    setState(() {
      widget.savedQuotes.remove(quote);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Özlü söz silindi'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
