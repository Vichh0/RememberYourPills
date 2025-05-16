import 'package:flutter/material.dart';
import 'package:remembreyourpills/Pages/Addpill.dart';
import 'package:remembreyourpills/Pages/ListPill.dart';
import 'package:remembreyourpills/Pages/home.dart';
import 'package:remembreyourpills/Pages/profile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home')),
                );
              },
            ),
            ListTile(
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Profilepage(title: 'Perfil')),
                );
              },
            ),
            ListTile(
              title: const Text('Lista de Píldoras'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Listpillpage(title: 'Lista')),
                );
              },
            ),
            ListTile(
              title: const Text('Añadir Píldora'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Addpillpage(title: 'Añadir Pildora')),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // Tema oscuro / claro (solo visual)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tema oscuro'),
                // Switch sin funcionalidad
                IgnorePointer(
                  child: Switch(
                    value: false,
                    onChanged: null,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),

            // Tamaño del texto (solo visual)
            Text(
              'Tamaño del texto: 16',
              style: TextStyle(fontSize: 16),
            ),
            IgnorePointer(
              child: Slider(
                min: 10,
                max: 30,
                divisions: 20,
                value: 16,
                onChanged: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
