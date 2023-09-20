import 'package:flutter/material.dart';
import 'registro.dart'; // Importa el archivo de registro

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin(BuildContext context) {
    // Simulación de inicio de sesión falso.
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == 'ygroth259@gmail.com' && password == 'yolo123') {
      // Redirige a la página principal (main.dart).
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      // Muestra un mensaje de error si las credenciales son incorrectas.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Error de inicio de sesión',
              style: TextStyle(color: Colors.red), // Color del título
            ),
            content: Text(
              'Credenciales incorrectas. Por favor, inténtalo de nuevo.',
              style: TextStyle(color: Colors.black), // Color del contenido
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.blue), // Color del botón
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión'),
        backgroundColor:
            Color.fromARGB(255, 9, 155, 148), // Color de la barra de navegación
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleLogin(context),
              child: Text(
                'Iniciar sesión',
                style: TextStyle(
                  color: Colors.white, // Color del texto del botón
                  fontWeight: FontWeight.bold, // Estilo de fuente
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 9, 155, 148), // Color de fondo del botón
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navega a la página de registro cuando se presiona el botón de registro.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegistroPage()));
              },
              child: Text(
                'Registrarse',
                style: TextStyle(
                  color: Color.fromARGB(255, 9, 155,
                      148), // Color del texto del botón de registro
                  decoration:
                      TextDecoration.underline, // Decoración de subrayado
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
