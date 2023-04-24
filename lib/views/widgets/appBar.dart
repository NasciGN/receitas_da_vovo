// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:receitas_da_vovo/views/components/constants.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({super.key, required this.pageName});
  final String pageName;

  @override
  Widget build(BuildContext context) {
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
      title: Text(
        pageName,
        style: const TextStyle(color: fontcolor),
      ),
      centerTitle: true,
      actions: [
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
                    value: 'brasileira', child: Text('Receitas Brasileiras')),
                PopupMenuItem(
                    value: 'mexicana', child: Text('Receitas Mexicanas')),
                PopupMenuItem(
                    value: 'japonesa', child: Text('Receitas Japonesas')),
              ];
            })
      ],
    );
  }
}

AppBar myAppBar(String pageName) {
  return AppBar(
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
            Icons.notifications,
            color: fontcolor,
          ))
    ],
  );
}
