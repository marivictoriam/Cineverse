import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text('Cineverse',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                Text('Populares',
                    style: TextStyle(
                      fontSize: 22,
                    )),
              ],
            ),
          ),
        ));
  }
}
