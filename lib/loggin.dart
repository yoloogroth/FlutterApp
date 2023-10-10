import 'package:flutter/material.dart';
import 'registro.dart';
import 'package:provider/provider.dart';
import 'services/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color.fromARGB(
            255, 163, 56, 196), // Color de la barra de navegación
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _userController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  final username = _userController.text;
                  final password = _passwordController.text;

                  final loginOk = await authService.login(username, password);

                  if (loginOk) {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    print('fallo el inicio de sesion');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 149, 54, 187), // Color de fondo del botón
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Color.fromARGB(
                        255, 31, 30, 30), // Color del texto del botón
                    fontWeight: FontWeight.bold, // Estilo de fuente
                  ),
                )),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navega a la página de registro cuando se presiona el botón de registro.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegistroPage()));
              },
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: Color.fromARGB(255, 165, 60,
                      197), // Color del texto del botón de registro
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
