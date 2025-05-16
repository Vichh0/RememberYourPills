import 'package:flutter/material.dart';
import 'package:remembreyourpills/Pages/Addpill.dart';
import 'package:remembreyourpills/Pages/Conf.dart';
import 'package:remembreyourpills/Pages/ListPill.dart';
import 'package:remembreyourpills/Pages/home.dart';
import 'package:remembreyourpills/Pages/profile.dart';

class Listpillpage extends StatelessWidget {
  const Listpillpage({super.key, required this.title});

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home')),
                );
              },
            ),
            ListTile(
              title: const Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profilepage(title: 'Perfil')),
                );
              },
            ),
            ListTile(
              title: const Text('Añadir Píldora'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Addpillpage(title: 'Añadir Píldora')),
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
      body: const CardListExample(),
    );
  }
}

class CardListExample extends StatelessWidget {
  const CardListExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> examplePills = [
      {
        'nombre': 'Paracetamol',
        'tiempo': '08:00 AM',
        'cantidad': '1 tableta',
        'restante': '1 semana',
      },
      {
        'nombre': 'Ibuprofeno',
        'tiempo': '01:00 PM',
        'cantidad': '2 tabletas',
        'restante': '3 días',
      },
      {
        'nombre': 'Vitamina C',
        'tiempo': '07:00 AM',
        'cantidad': '1 cápsula',
        'restante': '1 mes 1 semana y 4 días',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: examplePills.length,
      itemBuilder: (context, index) {
        final pill = examplePills[index];

        return Card(
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre: ${pill['nombre']}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Hora: ${pill['tiempo']}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Cantidad: ${pill['cantidad']}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Tiempo de consumo restante: ${pill['restante']}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      },
    );
  }
}
