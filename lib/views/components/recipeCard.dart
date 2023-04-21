import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/views/constants.dart';
import 'package:receitas_da_vovo/models/receita.dart';

class CardReceita extends StatelessWidget {
  const CardReceita({
    super.key,
    required this.size,
    required this.receita,
  });
  final Size size;
  final Receitas receita;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detail');
      },
      child: Container(
        margin: EdgeInsets.only(
          right: size.width * 0.05,
          bottom: size.height * 0.015,
        ),
        height: size.height * 0.20,
        width: size.width * 0.4,
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
            height: size.height * 0.05,
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
            child: Row(
              children: <Widget>[
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: receita.nome,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 46, 45, 45),
                      )),
                ]))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
