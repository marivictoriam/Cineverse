import 'package:flutter/material.dart';

class ScreenLoader extends StatelessWidget {
  final bool isMain;

  const ScreenLoader({super.key, required this.isMain});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
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
        ),
        if (!isMain)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 136, 173, 253),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
