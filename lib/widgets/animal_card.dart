import 'package:flutter/material.dart';
import 'package:controle_animais_hotel/models/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  final VoidCallback onDelete;

  const AnimalCard({Key? key, required this.animal, required this.onDelete}) : super(key: key); // Adicionando a chave key

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(animal.nomeTutor),
        subtitle: Text('${animal.especie} - ${animal.raca}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
        onTap: () {
          // Implementar a visualização/editar aqui se necessário
        },
      ),
    );
  }
}
