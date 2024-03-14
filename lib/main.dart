import 'package:flutter/material.dart';
import 'genero.dart';
import 'edad.dart';
import 'pais.dart';
import 'presentacion.dart';
import 'noticia.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Couteau';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static final List<Widget> _widgetOptions = <Widget>[
    Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.6),
        child: const Center(
          child: Text(
            'Nombre:\nJose Miguel Rosario Ureña\nMatricula:\n2029-7807',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white
              ),
            textAlign: TextAlign.center,
          ),
        )
    ),
    const genero(),
    const PaginaEdad(),
    const PaginaUniversidades(),
    noticia(),
    Text(
      'Index 4: clima',
      style: optionStyle,
    ),
    const presentacion()

  ];

  Widget _buildHomePage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('tools.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: _widgetOptions[_selectedIndex],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _selectedIndex == 0
          ? _buildHomePage()
          : _widgetOptions[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('tools.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(' ')),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Predecir Genero'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Determinar Edad'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Universidades'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Noticias'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
                        ListTile(
              title: const Text('Clima'),
              selected: _selectedIndex == 5,
              onTap: () {
                _onItemTapped(5);
                Navigator.pop(context);
              },
            ),
                        ListTile(
              title: const Text('Acerca de'),
              selected: _selectedIndex == 6,
              onTap: () {
                _onItemTapped(6);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
