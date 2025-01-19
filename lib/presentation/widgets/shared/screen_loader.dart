import 'package:flutter/material.dart';

class ScreenLoader extends StatelessWidget {
  const ScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Espere por favor',
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(height: 15),
          SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Color.fromARGB(255, 97, 96, 96),
              )),
          SizedBox(height: 15),
          Text(
            'Cargando...',
            style: TextStyle(fontSize: 22),
          )
        ],
      ),
    );
  }
}
