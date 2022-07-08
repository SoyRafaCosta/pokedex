import 'package:flutter/material.dart';

import 'package:pokedex_original/descricao.dart';
import 'package:pokedex_original/pokemon.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/',
        routes: {
          DescricaoPage.routName: ((context) => DescricaoPage()),
        },
        onGenerateRoute: (settings) {
          if (settings.name == DescricaoPage.routName) {
            final detalhe = settings.arguments as Pokemon;
            return MaterialPageRoute(builder: (context) {
              return DescricaoPage();
              //   name: detalhe.type,
              //   nome: detalhe.name,
              //   numero: detalhe.number,
              //   descricao: detalhe.description,

              // );
            });
          }
        });
  }
}
