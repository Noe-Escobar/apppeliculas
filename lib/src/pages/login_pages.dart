import 'package:apppeliculas/src/providers/login_user.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../shared/constantes.dart';
import '../widgets/input_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Image(
              image: AssetImage('assets/movieicon.png'),
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    InputForm(
                        label: 'Ingrese Su Usuario',
                        icon: Icons.email,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese un Email Valido';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    InputForm(
                      label: 'Ingrese Una Contraseña',
                      icon: Icons.password,
                      controller: passwordController,
                      obscureText: true,
                      showbutton: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese una Contraseña Valida';
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getInputValue(context);
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }

  getInputValue(BuildContext context) async {
    final saveToken = GetStorage();
    final navigator = Navigator.of(context);
    final futeroToken =
        await getToken(emailController.text, passwordController.text);
    if (formKey.currentState!.validate() && futeroToken != null) {
      await saveToken.write('token', futeroToken);
      navigator.pushNamed(Rutas.Pelis.name);
    }
  }
}
