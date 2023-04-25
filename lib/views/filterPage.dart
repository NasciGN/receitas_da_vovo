// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/views/components/constants.dart';
import 'package:receitas_da_vovo/views/widgets/appBar.dart';
import 'package:receitas_da_vovo/views/widgets/sections.dart';
import 'package:receitas_da_vovo/modelviews/receitas.dart';
import 'package:receitas_da_vovo/models/receita.dart';

class FilterRecipesPage extends StatelessWidget {
  const FilterRecipesPage({super.key, required this.recipesType});
  final String recipesType;
  @override
  Widget build(BuildContext context) {
    List<Receitas> cards = listaDeReceitas;
    List<Receitas> filterCards =
        cards.where((recipe) => recipe.nacionalidade == recipesType).toList();
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(pageName: 'Receitas')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultpd),
            child: Column(
              children: [
                SectionText(texto: "Culinária $recipesType"),
                Expanded(
                  child: SectionRecipesFilter(
                      recipeType: recipesType, listCards: filterCards),
                )
              ],
            ),
          ),
        )
        // bottomNavigationBar: const BottomBarWithFourItens(),
        );
  }
}
