// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/views/components/constants.dart';
import 'package:receitas_da_vovo/models/receita.dart';
import 'package:receitas_da_vovo/views/detailPage.dart';

class CardReceita extends StatelessWidget {
  const CardReceita(
      {super.key, required this.receita, required this.cardFontSize});
  final Receitas receita;
  final double cardFontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(receita: receita)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage(receita.urlReceita), fit: BoxFit.cover)),
        child: Column(children: [
          const Spacer(),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.timer,
                    color: Colors.white,
                  )),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultpd / 2),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 50,
                    color: Color.fromARGB(100, 0, 0, 0)),
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            child: AspectRatio(
              aspectRatio: 5 / 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: receita.nome,
                          style: TextStyle(
                            fontSize: cardFontSize,
                            color: const Color.fromARGB(255, 46, 45, 45),
                          )),
                    ])),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
