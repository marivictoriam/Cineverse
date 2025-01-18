import 'package:flutter/material.dart';

class ScreenLoader extends StatelessWidget {
  const ScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Espere por favor'),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(height: 10),
          Text('Cargando...')
        ],
      ),
    );
  }
}
