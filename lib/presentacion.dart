import 'package:flutter/material.dart';

class presentacion extends StatefulWidget {
  const presentacion({super.key});

  @override
  State<presentacion> createState() => _presentacionstate();
}

class _presentacionstate extends State<presentacion> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image(
              image: AssetImage('foto.jpg'),
            ),
          ),
          Text(
            'Jose Miguel Rosairo Ureña',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          Text(
            '2019-7807',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
