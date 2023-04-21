import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/models/receita.dart';
import 'package:receitas_da_vovo/modelviews/receitas.dart';
import 'package:receitas_da_vovo/views/components/recipeCard.dart';
import 'package:receitas_da_vovo/views/constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Receitas> cards = [receita1, receita2, receita3, receita4];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      Container(
        height: size.height * .02,
        decoration: const BoxDecoration(
            color: fbackground,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: <Widget>[
          SectionRecipesWithFourCards(
            size: size,
            listCards: cards,
            sectionTitle: 'Novas Receitas',
          ),
          SectionRecipesWithFourCards(
            size: size,
            listCards: cards,
            sectionTitle: 'Receitas Populares',
          ),
        ]),
      ),
    ]);
  }
}

class SectionRecipesWithFourCards extends StatelessWidget {
  const SectionRecipesWithFourCards(
      {super.key,
      required this.size,
      required this.listCards,
      required this.sectionTitle});

  final String sectionTitle;
  final List<Receitas> listCards;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultpd),
      child: Column(
        children: [
          SectionTextWithIconButtom(texto: sectionTitle),
          SizedBox(
            height: size.height * 0.45,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (BuildContext context, int i) {
                return CardReceita(size: size, receita: listCards[i]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTextWithIconButtom extends StatelessWidget {
  const SectionTextWithIconButtom({
    required this.texto,
    super.key,
  });
  final String texto;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          texto,
          style:
              const TextStyle(color: fontcolorblack, fontSize: sessionsfonsize),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: fontcolor,
            ))
      ],
    );
  }
}
