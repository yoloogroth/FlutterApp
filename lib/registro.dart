import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/auth_service.dart';

class RegistroPage extends StatelessWidget {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void logIn(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }

  void _handleRegistration(BuildContext context) {
    // Aquí puedes implementar la lógica de registro de usuarios.
    // Guardar la información de registro en tu base de datos, autenticar al usuario, etc.

    // Una vez registrado, puedes redirigir al usuario a la página de inicio de sesión o a donde desees.
    Navigator.pushReplacementNamed(
        context, '/'); // Redirigir a la página de inicio de sesión.
  }

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        backgroundColor: Color.fromARGB(
            255, 141, 38, 189), // Color de la barra de navegación
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
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = _emailController.text;
                final username = _nombreController.text;
                final password = _passwordController.text;

                final registerOk =
                    await authService.register(email, username, password);

                print(registerOk);
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 187, 99, 190),
                // Color de fondo del botón
              ),
              child: Text(
                'Sing up',
                style: TextStyle(
                    color: Color.fromARGB(
                        255, 211, 195, 195)), // Color del texto del botón
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                logIn(context);
              },
              child: Row(
                // a member? register now
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Are yoy alredy a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'LogIn',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
