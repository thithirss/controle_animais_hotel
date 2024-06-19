import 'package:flutter/material.dart';
import 'package:controle_animais_hotel/models/animal.dart';
import 'package:controle_animais_hotel/screens/animal_form_screen.dart';
import 'package:controle_animais_hotel/widgets/animal_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Animal> _animais = [];

  void _adicionarAnimal(Animal animal) {
    setState(() {
      _animais.add(animal);
    });
  }

  void _editarAnimal(Animal animal) {
    setState(() {
      int index = _animais.indexWhere((a) => a.id == animal.id);
      if (index != -1) {
        _animais[index] = animal;
      }
    });
  }

  void _excluirAnimal(Animal animal) {
    setState(() {
      _animais.removeWhere((a) => a.id == animal.id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${animal.nomeTutor} foi removido'),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _navegarParaFormulario([Animal? animal]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnimalFormScreen(
          adicionarAnimal: _adicionarAnimal,
          editarAnimal: _editarAnimal,
          animal: animal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animais Hospedados',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 78, 185, 6),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _animais.isEmpty
            ? Center(
                child: Text(
                  'Nenhum animal hospedado.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                
              )
            : ListView.builder(
                itemCount: _animais.length,
                itemBuilder: (context, index) {
                  final animal = _animais[index];
                  return Dismissible(
                    key: Key(animal.id),
                    background: Container(
                      color: Theme.of(context).colorScheme.error,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      child: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    onDismissed: (direction) {
                      _excluirAnimal(animal);
                    },
                    child: AnimalCard(
                      animal: animal,
                      onDelete: () => _excluirAnimal(animal),
                      onTap: () => _navegarParaFormulario(animal),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navegarParaFormulario(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
