import 'package:flutter/material.dart';
import 'package:remembreyourpills/Pages/Addpill.dart';
import 'package:remembreyourpills/Pages/Conf.dart';
import 'package:remembreyourpills/Pages/ListPill.dart';
import 'package:remembreyourpills/Pages/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Bienvenido a la pantalla de inicio',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      body: Center(child: _widgetOptions[_selectedIndex]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Perfil'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Profilepage(title: 'perfil')));
              },
            ),
            ListTile(
              title: const Text('Lista'),
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const Listpillpage(title: 'Lista')));
              },
            ),
            ListTile(
              title: const Text('Añadir Pildora'),
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const Addpillpage(title: 'Añadir')));
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
    );
  }
}
