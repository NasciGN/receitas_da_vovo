// ignore_for_file: file_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/models/receita.dart';
import 'package:receitas_da_vovo/views/widgets/appBar.dart';
import 'package:receitas_da_vovo/views/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receitas_da_vovo/views/widgets/sections.dart';

import '../modelviews/functions.dart';

class DetailPage extends StatelessWidget {
  final Receitas receita;

  const DetailPage({required this.receita});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Uri url = Uri(
        scheme: 'https',
        host: 'youtube.com',
        path: '/watch',
        queryParameters: {"v": receita.url});
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(pageName: "Receita")),
        body: SingleChildScrollView(
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RecipeTItleWithIcon(size: size, receita: receita),
              RecipeImage(size: size, receita: receita),
              SizedBox(
                height: size.height * .01,
              ),
              RecipeInfoCard(receita: receita),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultpd, vertical: defaultpd),
                child: Text(
                  'Ingredientes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              RecipeIngredientGenerator(receita: receita),
              RecipePrepModeSection(receita: receita),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultpd, vertical: defaultpd),
                child: Text(
                  'Ficou com dúvida? Veja nosso tutorial:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    launchInWebViewOrVC(url);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(defaultpd),
                    height: 45,
                    width: size.width * .4,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: fontcolor,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'Ver tutorial',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          FaIcon(FontAwesomeIcons.play, color: Colors.white)
                        ]),
                  ),
                ),
              )
            ]),
          ),
        ),
        bottomNavigationBar: const BottomBarWithFourItens());
  }
}

class RecipePrepModeSection extends StatelessWidget {
  const RecipePrepModeSection({
    super.key,
    required this.receita,
  });

  final Receitas receita;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultpd, vertical: defaultpd * 2),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Modo de preparo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          receita.modoPreparo,
          style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ]),
    );
  }
}

class RecipeIngredientGenerator extends StatelessWidget {
  const RecipeIngredientGenerator({
    super.key,
    required this.receita,
  });

  final Receitas receita;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultpd),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: receita.ingredientes.length,
          itemBuilder: (BuildContext context, int index) {
            return IngredietRow(ingredient: "${receita.ingredientes[index]}");
          }),
    );
  }
}

class RecipeInfoCard extends StatelessWidget {
  const RecipeInfoCard({
    super.key,
    required this.receita,
  });

  final Receitas receita;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultpd),
      padding: const EdgeInsets.symmetric(
          vertical: defaultpd / 2, horizontal: defaultpd * 2),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 158, 158, 158)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: const [
              Text(
                "3",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: sessionsfonsize),
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
                    fontWeight: FontWeight.bold, fontSize: sessionsfonsize),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "${receita.tempoPreparo}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: sessionsfonsize),
              ),
              const Text("T. de Preparo"),
            ],
          ),
        ],
      ),
    );
  }
}

class RecipeImage extends StatelessWidget {
  const RecipeImage({
    super.key,
    required this.size,
    required this.receita,
  });

  final Size size;
  final Receitas receita;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .4,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('${receita.urlReceita}'), fit: BoxFit.cover)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
    );
  }
}

class RecipeTItleWithIcon extends StatelessWidget {
  const RecipeTItleWithIcon({
    super.key,
    required this.size,
    required this.receita,
  });

  final Size size;
  final Receitas receita;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultpd),
        height: size.height * .1,
        child: Row(
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
        ));
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
