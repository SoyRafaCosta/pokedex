import 'package:flutter/material.dart';
import 'package:pokedex_original/pokemon.dart';

class DescricaoPage extends StatefulWidget {
  const DescricaoPage({Key? key}) : super(key: key);

  static const routName = '/descricao';

  @override
  State<DescricaoPage> createState() => _DescricaoPageState();
}

class _DescricaoPageState extends State<DescricaoPage> {
  @override
  Widget build(BuildContext context) {
    final detalhe = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(title: Text(detalhe.name ?? '')),
      body: Card(
        color: Colors.black,
        elevation: 20,
        margin:
            const EdgeInsets.only(bottom: 100, top: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text('#${(detalhe.number ?? '')}'),
                    ),
                  ),
                  Image.network(
                    'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png',
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      detalhe.description.toString(),
                      style: const TextStyle(fontSize: 15.0),
                    ),
                  ),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        margin: const EdgeInsets.all(5),
                        child: const Text(
                          'Tipo:',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        margin: const EdgeInsets.all(5),
                        child: Text(
                          '${(detalhe.type ?? '')}',
                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    thickness: 1,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
