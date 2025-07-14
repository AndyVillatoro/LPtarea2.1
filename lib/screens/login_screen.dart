import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //clave para el formulario, permite validar y guardar el estado del mismo
  final _formKey = GlobalKey<FormState>();
  //controladores para campos de texto de correo y contraseña
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //metodo simular el inicio de sesión
  void _login() {
    //valida el formulario usando la _formKey
    if (_formKey.currentState!.validate()) {
      //credenciales fijas
      if ((_emailController.text == 'andy.portillo@unah.hn' &&
              _passwordController.text == '20192001349') ||
          (_emailController.text == 'pramoss@unah.hn' &&
              _passwordController.text == '20232030431')) {
        //i las credenciales son correctas, navega a la pantalla de inicio
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        //si son incorrectas, error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Correo o contraseña incorrectos')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      '¡Aloo!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Accede a plataformas premium con tu cuenta institucional de forma gratis.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 48),
                    CustomTextField(
                      controller: _emailController,
                      labelText: 'Correo Institucional',
                      icon: Icons.email_outlined,
                      validator: (value) =>
                          value!.isEmpty ? 'Este campo es obligatorio' : null,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _passwordController,
                      labelText: 'Contraseña (N° de cuenta (ㆆ_ㆆ) )',
                      icon: Icons.lock_outline,
                      isPassword: true,
                      validator: (value) =>
                          value!.isEmpty ? 'Este campo es obligatorio' : null,
                    ),
                    const SizedBox(height: 48),
                    ElevatedButton(
                      onPressed: _login,
                      child: const Text('Ingresar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE53935),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: '¿No tienes una cuenta? ',
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Crea una cuenta',
                              style: TextStyle(
                                color: Color(0xFFE53935),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
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
