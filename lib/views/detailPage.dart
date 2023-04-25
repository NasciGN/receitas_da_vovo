// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/models/receita.dart';
import 'package:receitas_da_vovo/views/widgets/appBar.dart';
import 'package:receitas_da_vovo/views/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receitas_da_vovo/views/widgets/sections.dart';

class DetailPage extends StatelessWidget {
  final Receitas receita;

  const DetailPage({required this.receita});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(pageName: "Receita")),
        body: SingleChildScrollView(
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: defaultpd),
                  height: size.height * .1,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${receita.nome}',
                        style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: titlefontsize),
                      ),
                      const Spacer(),
                      const FaIcon(FontAwesomeIcons.utensils)
                    ],
                  )),
              Container(
                height: size.height * .3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('${receita.urlReceita}'),
                        fit: BoxFit.cover)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.solidHeart),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share_sharp),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark),
                        color: Colors.white,
                      ),
                    ]),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: defaultpd),
                padding: const EdgeInsets.symmetric(
                    vertical: defaultpd / 2, horizontal: defaultpd * 2),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 158, 158, 158)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "3",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: sessionsfonsize),
                        ),
                        Text("Porções"),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.solidStar,
                              color: fontcolor,
                              size: 20,
                            ),
                            FaIcon(
                              FontAwesomeIcons.solidStar,
                              color: fontcolor,
                            ),
                            FaIcon(
                              FontAwesomeIcons.solidStar,
                              color: fontcolor,
                              size: 20,
                            ),
                          ],
                        ),
                        Text(
                          "${receita.dificuldade}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: sessionsfonsize),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${receita.tempoPreparo}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: sessionsfonsize),
                        ),
                        const Text("T. de Preparo"),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultpd, vertical: defaultpd),
                child: Text(
                  'Ingredientes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultpd),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: receita.ingredientes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return IngredietRow(
                          ingredient: "${receita.ingredientes[index]}");
                    }),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultpd, vertical: defaultpd),
                child: Text(
                  'Modo de preparo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultpd, vertical: defaultpd),
                child: Text(
                  receita.modoPreparo,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultpd, vertical: defaultpd),
                child: Text(
                  'Ficou com dúvida? Veja nosso tutorial:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: const BottomBarWithFourItens());
  }
}

class IngredietRow extends StatelessWidget {
  const IngredietRow({super.key, required this.ingredient});
  final String ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultpd / 4),
      child: Row(
        children: [
          const FaIcon(
            FontAwesomeIcons.solidSquarePlus,
            size: 15,
            color: icongreencolor,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            ingredient,
            maxLines: 3,
            style:
                const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
          )
        ],
      ),
    );
  }
}
