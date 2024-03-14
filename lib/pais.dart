import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PaginaUniversidades extends StatefulWidget {
  const PaginaUniversidades({Key? key}) : super(key: key);

  @override
  _PaginaUniversidadesState createState() => _PaginaUniversidadesState();
}

class _PaginaUniversidadesState extends State<PaginaUniversidades> {
  List<dynamic> _universidades = [];
  TextEditingController _controladorUniversidad = TextEditingController();

  Future<void> _obtenerUniversidades(String universidad) async {
   
    String universidadFormateada = universidad.replaceAll(' ', '+');
    final respuesta = await http.get(Uri.parse('http://universities.hipolabs.com/search?name=$universidadFormateada'));
    if (respuesta.statusCode == 200) {
      setState(() {
        _universidades = json.decode(respuesta.body);
      });
    } else {
      throw Exception('Error al cargar las universidades');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universidades por Nombre'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controladorUniversidad,
            decoration: InputDecoration(
              labelText: 'Nombre de la Universidad',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  _obtenerUniversidades(_controladorUniversidad.text);
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _universidades.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_universidades[index]['name']),
                  subtitle: Text(_universidades[index]['country']),
                  onTap: () {
                    
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
