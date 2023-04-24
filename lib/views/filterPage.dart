// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/views/widgets/appBar.dart';
import 'package:receitas_da_vovo/views/widgets/sections.dart';
import 'package:receitas_da_vovo/modelviews/receitas.dart';
import 'package:receitas_da_vovo/models/receita.dart';

class FilterRecipesPage extends StatelessWidget {
  final String recipesType;
  const FilterRecipesPage({super.key, required this.recipesType});

  @override
  Widget build(BuildContext context) {
    List<Receitas> cards = [
      receita1,
      receita2,
      receita3,
      receita4,
      receita5,
      receita6,
      receita7,
      receita8,
    ];
    List<Receitas> filterCards =
        cards.where((recipe) => recipe.nacionalidade == recipesType).toList();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myAppBar('Receitas'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionRecipesFilter(
                recipeType: recipesType,
                sectionTitle: 'Culinária $recipesType',
                listCards: filterCards,
                size: size)
          ],
        ),
      ),
      // bottomNavigationBar: const BottomBarWithFourItens(),
    );
  }
}
