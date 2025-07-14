import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
// los comentarios son para estudiar :c

class _RegisterScreenState extends State<RegisterScreen> {
  //clave para el formulario, permite validar y guardar el estado del mismo
  final _formKey = GlobalKey<FormState>();
  //cControladores para los campos de texto
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  // Simulaishon
  void _register() {
    //valida el formulario usando la _formKey
    if (_formKey.currentState!.validate()) {
      //simuleishon registro exitoso
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Registro exitoso')));
      //regresa a la pantalla anterior (login)
      Navigator.pop(context);
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es obligatorio';
    }
    //valida que correo termine con '@unah.hn'
    if (!value.endsWith('@unah.hn')) {
      return 'El correo debe ser de dominio @unah.hn';
    }
    return null;
  }

  //validador campo de contraseña
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es obligatorio';
    }
    //6 caracteres
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    //caracter especial
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'La contraseña debe tener un caracter especial';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Crear una cuenta',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 48),
                  CustomTextField(
                    controller: _nameController,
                    labelText: 'Nombre Completo',
                    icon: Icons.person_outline,
                    validator: (value) =>
                        value!.isEmpty ? 'Este campo es obligatorio' : null,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _emailController,
                    labelText: 'Correo Electrónico',
                    icon: Icons.email_outlined,
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _phoneController,
                    labelText: 'Teléfono',
                    icon: Icons.phone_outlined,
                    validator: (value) =>
                        value!.isEmpty ? 'Este campo es obligatorio' : null,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _passwordController,
                    labelText: 'Contraseña',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: _register,
                    child: const Text('Registrarse'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE53935),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
