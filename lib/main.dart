import 'package:doou/bindings/main_binding.dart';
import 'package:doou/screens/cadastro_campanha.dart';
import 'package:doou/screens/cadastros_usuario_page.dart';
import 'package:doou/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Doou',

    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(
    //         seedColor: const Color.fromRGBO(72, 141, 146, 1.0)),
    //     useMaterial3: true,
    //   ),
    //   home: home_page(),
    // );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doou',
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => login_page()),
        GetPage(name: "/home", page: () => home_page(), binding: MainBinding()),
        GetPage(name: "/cadastro", page: () => cadastro_usuario()),
        GetPage(
            name: "/cadastroCampanha", page: () => CadastroCampanhaScreen()),
      ],
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(72, 141, 146, 1.0)),
        useMaterial3: true,
      ),
      // home: home_page(),
    );
  }
}
