import 'package:apppeliculas/src/shared/constantes.dart';
import 'package:apppeliculas/src/shared/not_found.dart';
import 'package:apppeliculas/src/shared/rutas.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final token = GetStorage().read('token');
    String iniciar;
    if (token != null) {
      iniciar = Rutas.Pelis.name;
    } else {
      iniciar = Rutas.loginpage.name;
    }

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'Apppeliculas',
      initialRoute: iniciar,
      routes: rutas,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const NotFound();
        });
      },
    );
  }
}
