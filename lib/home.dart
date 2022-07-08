import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex_original/descricao.dart';

import 'package:pokedex_original/pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> listadePokemons = [];
  bool carregando = true;

  @override
  void initState() {
    _getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 200),
              child: const Text('Pokedex do Rafa'),
              //centerTitle: true,
            ),
            Image.network(
                'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
                height: 30,
                width: 30),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: listadePokemons.length,
        itemBuilder: (context, index) {
          //return DescricaoPage(detalhe: listadePokemons[index]);
          return Card(
            child: ListTile(
              onTap: () {
                //DescricaoPage(detalhe: listadePokemons[index]);
                Navigator.pushNamed(context, DescricaoPage.routName,
                    arguments: Pokemon()
                    // '/descricao',
                    // arguments: Pokemon(
                    //   type: listadePokemons[index].type,
                    // ),
                    );
                //   name: listadePokemons[index].name,
                //   descripton: listadePokemons[index].description,
                //   number: listadePokemons[index].number,
                //   image: listadePokemons[index].thumbnailImage,
                //   type: listadePokemons[index].type,
                //   weakness: listadePokemons[index].weakness,
                // ),
              },
              leading: Image.network(
                  listadePokemons[index].thumbnailImage.toString()),
              title: Text(listadePokemons[index].name ?? ''),
              trailing: Text('#${listadePokemons[index].number}'),
            ),
          );
        },
      ),
    );
  }

  void _getPokemons() {
    Uri url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');

    setState(() {
      carregando = true;
    });

    http.get(url).then((value) {
      if (value.statusCode == 200) {
        Map json = const JsonDecoder().convert(value.body);

        // ignore: avoid_function_literals_in_foreach_calls
        (json['data'] as List).forEach((element) {
          listadePokemons.add(Pokemon.fromJson(element));
        });
        setState(() {
          carregando = false;
        });
      }
    });
  }
}
