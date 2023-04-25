import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/views/components/constants.dart';
import 'package:receitas_da_vovo/models/receita.dart';
import 'package:receitas_da_vovo/views/components/recipeCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarWithFourItens extends StatelessWidget {
  const BottomBarWithFourItens({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: fbackground,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          icon: const FaIcon(FontAwesomeIcons.house),
          color: fontcolor,
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.fire),
          color: fontcolor,
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.bookBookmark),
          color: fontcolor,
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.cartShopping),
          color: fontcolor,
        ),
      ]),
    );
  }
}

class SectionRecipesFilter extends StatelessWidget {
  const SectionRecipesFilter(
      {super.key,
      required this.recipeType,
      required this.sectionTitle,
      required this.listCards,
      required this.size});
  final String recipeType;
  final Size size;
  final String sectionTitle;
  final List<Receitas> listCards;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultpd),
      child: Column(
        children: [
          SectionText(texto: sectionTitle),
          SizedBox(
            height: size.height,
            child: GridView.builder(
              //physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              itemCount: listCards.length,
              itemBuilder: (BuildContext context, int i) {
                if (listCards[i].nacionalidade == recipeType) {
                  return CardReceita(size: size, receita: listCards[i]);
                }
              },
            ),
          ),
        ],
      ),
    );
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
            height: size.height - (size.height * 0.50),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
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

class SectionText extends StatelessWidget {
  const SectionText({
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
        //const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.soup_kitchen_sharp,
              color: fontcolor,
            ))
      ],
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
