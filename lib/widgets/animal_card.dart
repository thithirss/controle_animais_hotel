import 'package:flutter/material.dart';
import 'package:controle_animais_hotel/models/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  final VoidCallback onDelete;
  final VoidCallback onTap; // Adicionando o callback onTap

  const AnimalCard({
    Key? key,
    required this.animal,
    required this.onDelete,
    required this.onTap, // Incluindo o parâmetro onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(animal.nomeTutor),
        subtitle: Text('${animal.especie} - ${animal.raca}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
        onTap: onTap, // Adicionando o onTap aqui
      ),
    );
  }
}
