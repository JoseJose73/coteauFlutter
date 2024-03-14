import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaginaEdad extends StatefulWidget {
  const PaginaEdad({Key? key}) : super(key: key);

  @override
  _PaginaEdadState createState() => _PaginaEdadState();
}

class _PaginaEdadState extends State<PaginaEdad> {
  TextEditingController _controladorNombre = TextEditingController();
  String _edad = '';
  String _imagen = '';

  Future<void> _obtenerEdad(String nombre) async {
    final respuesta = await http.get(Uri.parse('https://api.agify.io/?name=$nombre'));
    if (respuesta.statusCode == 200) {
      Map<String, dynamic> datos = json.decode(respuesta.body);
      int edad = datos['age'];
      setState(() {
        _edad = edad.toString();
        if (edad >= 1 && edad <= 17) {
          _imagen = 'muchacho.jpeg';
        } else if (edad >= 18 && edad <= 49) {
          _imagen = 'adulto.jpeg';
        } else {
          _imagen = 'viejo.jpeg';
        }
      });
    } else {
      throw Exception('Error al cargar la edad');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Determinar Edad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controladorNombre,
              decoration: InputDecoration(
                hintText: 'Ingresa tu nombre',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _obtenerEdad(_controladorNombre.text);
              },
              child: const Text('Enviar'),
            ),
            const SizedBox(height: 20),
            Text('Edad: $_edad'),
            const SizedBox(height: 20),
            if (_imagen.isNotEmpty) Image.asset(_imagen),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controladorNombre.dispose();
    super.dispose();
  }
}
