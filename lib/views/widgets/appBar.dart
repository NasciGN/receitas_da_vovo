// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/views/components/constants.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar(
      {super.key, required this.pageName, required this.cardFontSize});
  final String pageName;
  final double cardFontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        color: fbackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultpd),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                color: fontcolor,
              ),
              Text(
                pageName,
                style: const TextStyle(
                    color: fontcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              PopupMenuButton(
                  onSelected: (String value) {
                    Navigator.of(context)
                        .pushNamed('/filterRecipe', arguments: value);
                  },
                  icon: const Icon(
                    Icons.book,
                    color: fontcolor,
                  ),
                  itemBuilder: (BuildContext context) {
                    return const [
                      PopupMenuItem(
                          value: 'brasileira',
                          child: Text('Receitas Brasileiras')),
                      PopupMenuItem(
                          value: 'mexicana', child: Text('Receitas Mexicanas')),
                      PopupMenuItem(
                          value: 'japonesa', child: Text('Receitas Japonesas')),
                    ];
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.pageName});
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        color: fbackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultpd),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: fontcolor,
              ),
              Text(
                pageName,
                style: const TextStyle(
                    color: fontcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              PopupMenuButton(
                  onSelected: (String value) {
                    Navigator.of(context).pushReplacementNamed('/filterRecipe',
                        arguments: value);
                  },
                  icon: const Icon(
                    Icons.book,
                    color: fontcolor,
                  ),
                  itemBuilder: (BuildContext context) {
                    return const [
                      PopupMenuItem(
                          value: 'brasileira',
                          child: Text('Receitas Brasileiras')),
                      PopupMenuItem(
                          value: 'mexicana', child: Text('Receitas Mexicanas')),
                      PopupMenuItem(
                          value: 'japonesa', child: Text('Receitas Japonesas')),
                    ];
                  })
            ],
          ),
        ),
      ),
    );
  }
}


/* 
AppBar(
    iconTheme: const IconThemeData(color: fontcolor),
    elevation: 0,
    backgroundColor: fbackground,
    title: Text(
      pageName,
      style: const TextStyle(color: fontcolor),
    ),
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share_sharp,
          ))
    ],
  );
 */