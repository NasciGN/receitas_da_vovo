// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/models/receita.dart';
import 'package:receitas_da_vovo/views/widgets/appBar.dart';
import 'package:receitas_da_vovo/views/components/constants.dart';

class DetailPage extends StatelessWidget {
  final Receitas receita;

  const DetailPage({required this.receita});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myAppBar('${receita.nome}'),
      body: Column(children: [
        Container(
          height: size.height * .3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('${receita.urlReceita}'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultpd),
            child: Column(children: [
              Row(children: [
                Text(
                  '${receita.nome}',
                  style: const TextStyle(fontSize: 25),
                ),
                const Spacer(),
                const Icon(Icons.timer),
                Text(
                  '${receita.tempoPreparo}',
                  style: const TextStyle(fontSize: 20),
                )
              ]),
            ])),
      ]),
    );
  }
}
