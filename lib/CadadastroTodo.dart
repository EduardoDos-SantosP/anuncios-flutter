import 'package:flutter/material.dart';
import 'package:todo/model/Anuncio.dart';

class CadastroAnuncio extends StatefulWidget {
  Anuncio? anuncio;
  CadastroAnuncio({this.anuncio, super.key});

  @override
  State<CadastroAnuncio> createState() => _CadastroAnuncioState();
}

class _CadastroAnuncioState extends State<CadastroAnuncio> {
  TextEditingController nomeC = TextEditingController();
  TextEditingController descricaoC = TextEditingController();
  TextEditingController precoC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    var a = widget.anuncio;
    if (a == null) return;
    nomeC.text = a.nome;
    descricaoC.text = a.descricao;
    precoC.text = a.preco.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anúncio'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                TextFormField(
                  controller: nomeC,
                  decoration: const InputDecoration(
                    label: Text('Nome'),
                  ),
                  validator: (value) {
                    if (value == null || value == '') {
                      return 'Campo obrigatório';
                    }
                  },
                ),
                TextFormField(
                  controller: descricaoC,
                  decoration: const InputDecoration(
                    label: Text('Descrição'),
                  ),
                ),
                TextFormField(
                  controller: precoC,
                  decoration: const InputDecoration(
                    label: Text('Preço'),
                  ),
                  validator: (value) {
                    var preco = double.tryParse(value ?? '');
                    if (preco == null) return 'Somente números';
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor),
                      fixedSize: MaterialStatePropertyAll(Size(500, 40)),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;

                      Anuncio tarefa = Anuncio(
                        nomeC.text,
                        double.parse(precoC.text),
                        descricaoC.text,
                      );

                      Navigator.pop(context, tarefa);
                    },
                    child: Text(
                      'Salvar',
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
