import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class genero extends StatefulWidget {
  const genero({Key? key}) : super(key: key);

  @override
  _generoState createState() => _generoState();
}

class _generoState extends State<genero> {
  final TextEditingController _controladorNombre = TextEditingController();
  Color _colorFondo = Colors.white;

  Future<void> _buscarGenero(String nombre) async {
    final respuesta = await http.get(Uri.parse('https://api.genderize.io/?name=$nombre'));
    if (respuesta.statusCode == 200) {
      Map<String, dynamic> datos = json.decode(respuesta.body);
      String genero = datos['gender'];
      setState(() {
        _colorFondo = genero == 'male' ? Colors.blue : Colors.pink;
      });
    } else {
      throw Exception('Error al cargar el género');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Género'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controladorNombre,
              decoration: const InputDecoration(
                hintText: 'Ingresa tu nombre',
                hintStyle: TextStyle(fontSize: 30)
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _buscarGenero(_controladorNombre.text);
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
      backgroundColor: _colorFondo,
    );
  }

  @override
  void dispose() {
    _controladorNombre.dispose();
    super.dispose();
  }
}
