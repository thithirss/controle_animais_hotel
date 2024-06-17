import 'package:flutter/material.dart';
import 'package:controle_animais_hotel/models/animal.dart';
import 'package:controle_animais_hotel/screens/animal_form_screen.dart';
import 'package:controle_animais_hotel/widgets/animal_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Animal> _animais = []; // Lista de animais hospedados

  // Método para adicionar um novo animal à lista
  void _adicionarAnimal(Animal animal) {
    setState(() {
      _animais.add(animal);
    });
  }

  // Método para excluir um animal da lista
  void _excluirAnimal(int index) {
    setState(() {
      _animais.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Animais'),
      ),
      body: ListView.builder(
        itemCount: _animais.length,
        itemBuilder: (context, index) {
          return AnimalCard(
            animal: _animais[index],
            onDelete: () => _excluirAnimal(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnimalFormScreen(adicionarAnimal: _adicionarAnimal),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
