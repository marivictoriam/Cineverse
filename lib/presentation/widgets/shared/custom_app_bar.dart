import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String subtitle;

  const CustomAppbar({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 136, 173, 253),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                    Center(
                        child: Text(
                      'Cineverse',
                      style: Theme.of(context).textTheme.headlineLarge,
                    )),
                  ],
                ),
                Text(subtitle,
                    style: const TextStyle(
                      fontSize: 22,
                    )),
              ],
            ),
          ),
        ));
  }
}
