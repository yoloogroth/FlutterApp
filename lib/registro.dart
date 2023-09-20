import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleRegistration(BuildContext context) {
    // Aquí puedes implementar la lógica de registro de usuarios.
    // Guardar la información de registro en tu base de datos, autenticar al usuario, etc.

    // Una vez registrado, puedes redirigir al usuario a la página de inicio de sesión o a donde desees.
    Navigator.pushReplacementNamed(
        context, '/'); // Redirigir a la página de inicio de sesión.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor:
            Color.fromARGB(255, 9, 155, 148), // Color de la barra de navegación
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleRegistration(context),
              child: Text(
                'Registrarse',
                style:
                    TextStyle(color: Colors.white), // Color del texto del botón
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 9, 155, 148), // Color de fondo del botón
              ),
            ),
          ],
        ),
      ),
    );
  }
}
