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
  // Lista simulada de píldoras próximas a tomar
  final List<Map<String, String>> _nextPills = [
    {'name': 'Paracetamol', 'time': '08:00 AM'},
    {'name': 'Ibuprofeno', 'time': '12:00 PM'},
    {'name': 'Vitamina C', 'time': '06:00 PM'},
  ];

  Widget _buildNextPillsCardList() {
    if (_nextPills.isEmpty) {
      return Card(
        margin: const EdgeInsets.all(16),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Text('No hay píldoras próximas a tomar.'),
        ),
      );
    }
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Próximas píldoras a tomar:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ..._nextPills.map((pill) => ListTile(
                  leading: const Icon(Icons.medication),
                  title: Text(pill['name'] ?? ''),
                  subtitle: Text('Hora: ${pill['time']}'),
                )),
          ],
        ),
      ),
    );
  }
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
