// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:receitas_da_vovo/modelviews/receitas.dart';
import 'package:receitas_da_vovo/models/receita.dart';
import 'package:receitas_da_vovo/views/widgets/appBar.dart';
import 'package:receitas_da_vovo/views/widgets/sections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Receitas> cardsNew = [
    receita1,
    receita2,
    receita3,
    receita4,
    receita5,
    receita6,
    receita7
  ];
  List<Receitas> cardsPopular = [
    receita8,
    receita6,
    receita3,
    receita5,
    receita4,
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyHomeAppBar(
            pageName: 'Home',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                SectionRecipesWithFourCards(
                  size: size,
                  listCards: cardsNew,
                  sectionTitle: 'Novas Receitas',
                ),
                SectionRecipesWithFourCards(
                  size: size,
                  listCards: cardsPopular,
                  sectionTitle: 'Receitas populares',
                ),
              ]),
            ),
          ]),
        ),
        bottomNavigationBar: const BottomBarWithFourItens());
  }
}
