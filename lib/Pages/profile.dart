import 'package:flutter/material.dart';
import 'package:remembreyourpills/Pages/Addpill.dart';
import 'package:remembreyourpills/Pages/Conf.dart';
import 'package:remembreyourpills/Pages/ListPill.dart';
import 'package:remembreyourpills/Pages/home.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key, required this.title});

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
              child: Text('Menú'),
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
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16),
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Nombre de usuario:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text('Juan Pérez'),
                  SizedBox(height: 16),
                  Text(
                    'Correo electrónico:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text('juan.perez@example.com'),
                  SizedBox(height: 16),
                  Text(
                    'Número de contacto:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text('+34 600 123 456'),
                  SizedBox(height: 16),
                  Text(
                    'Número de emergencia:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text('+34 900 654 321'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
