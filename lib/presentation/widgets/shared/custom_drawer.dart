import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Color.fromARGB(255, 136, 173, 253)],
                    begin: Alignment.topLeft,
                    stops: [0.2, 0.8])),
            child:
                Text('Menu', style: Theme.of(context).textTheme.headlineLarge),
          ),
          ListTile(
            title: const Text('Peliculas', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.pop(context);
              GoRouter.of(context).go('/home');
            },
          ),
          const ListTile(title: Divider()),
          ListTile(
            title: const Text('Actores', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.pop(context);
              GoRouter.of(context).go('/actors');
            },
          ),
        ],
      ),
    );
  }
}
