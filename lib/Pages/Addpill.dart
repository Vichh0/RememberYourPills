import 'package:flutter/material.dart';
import 'package:remembreyourpills/Pages/Conf.dart';
import 'package:remembreyourpills/Pages/ListPill.dart';
import 'package:remembreyourpills/Pages/home.dart';
import 'package:remembreyourpills/Pages/profile.dart';

class Addpillpage extends StatelessWidget {
  const Addpillpage({super.key, required this.title});

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
              title: const Text('Configuracion'),
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage(title: 'Configuracion')));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Añadir nueva píldora',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(labelText: 'Nombre de la píldora'),
                    ),
                    const SizedBox(height: 8),
                    const TextField(
                      decoration: InputDecoration(labelText: 'Tiempo de consumo'),
                    ),
                    const SizedBox(height: 8),
                    const TextField(
                      decoration: InputDecoration(labelText: 'Cantidad'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 8),
                    const TextField(
                      decoration: InputDecoration(labelText: 'Tiempo de consumo restante'),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: null,
                      child: const Text('Agregar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
