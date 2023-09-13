import 'package:flutter/material.dart';

import 'CadadastroTodo.dart';
import 'model/Anuncio.dart';

class HomePage extends StatefulWidget {
  String title;

  HomePage({required this.title, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Anuncio> anuncios = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anúncios'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView.builder(
          itemCount: anuncios.length,
          itemBuilder: (context, i) {
            var anuncio = anuncios[i];
            return Dismissible(
              key: Key(anuncio.nome),
              background: Container(
                color: Colors.red,
                child: const Align(
                  alignment: Alignment(-.9, 0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  anuncios.removeAt(i);
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 3),
                child: ListTile(
                  title: Text("${anuncio.nome} - ${anuncio.preco} R\$"),
                  tileColor: Theme.of(context).hoverColor,
                  onLongPress: () async {
                    Anuncio? a = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => CadastroAnuncio(anuncio: anuncio)),
                    );
                    if (a == null) return;
                    setState(() {
                      anuncios[i] = a;
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () async {
          Anuncio? a = await Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => CadastroAnuncio()),
          );
          if (a == null) return;
          setState(() {
            anuncios.add(a);
          });
        },
      ),
    );
  }
}
