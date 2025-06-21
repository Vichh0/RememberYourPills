import 'package:flutter/material.dart';
import 'package:remembreyourpills/Pages/home.dart';

class Login extends StatelessWidget{
  const Login({super.key, required String title});

  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size; 
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home')))
              }, 
              child: const Text('Iniciar Secion'),
            )
          ],
        )
      ),
    );
  }
}