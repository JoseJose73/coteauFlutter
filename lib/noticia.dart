import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class noticia extends StatefulWidget {
  const noticia({super.key});

  @override
  _noticiaState createState() => _noticiaState();
}

class _noticiaState extends State<noticia> {
  List<String> _links = [];

  @override
  void initState() {
    super.initState();
    _fetchLinks();
  }

  Future<void> _fetchLinks() async {
    final response = await http.get(Uri.parse('https://www.begindot.com/es/wp-json/wp/v2/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<String> links = data.map((e) => e['link']).cast<String>().toList();
      setState(() {
        _links = links;
      });
    } else {
      throw Exception('Failed to load links');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
      ),
      body: ListView.builder(
        itemCount: _links.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Noticia ${index + 1}'),
            onTap: () {
              // Aquí puedes manejar la navegación al enlace correspondiente
              String url = _links[index];
              // Por ejemplo, puedes abrir el enlace en un navegador web externo
              // usando la librería url_launcher
              // Aquí un ejemplo básico:
              launch(url);
            },
          );
        },
      ),
    );
  }
}