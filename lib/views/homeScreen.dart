import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/views/components/body.dart';
import 'package:receitas_da_vovo/views/components/recipeCard.dart';
import 'package:receitas_da_vovo/views/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: const Body(),
    );
  }

  AppBar MyAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: fbackground,
      leading: IconButton(
          padding: const EdgeInsets.all(defaultpd),
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: fontcolor,
          )),
      title: const Text(
        'Home',
        style: TextStyle(color: fontcolor),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: fontcolor,
            ))
      ],
    );
  }
}
