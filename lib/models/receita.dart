import 'package:flutter/material.dart';

class Receitas {
  final String nome;
  final String descricao;
  final List ingredientes;
  final String modoPreparo;
  final String tempoPreparo;
  final String urlReceita;
  final String dificuldade;

  Receitas({
    required this.nome,
    required this.descricao,
    required this.ingredientes,
    required this.modoPreparo,
    required this.tempoPreparo,
    required this.urlReceita,
    required this.dificuldade,
  });
}
