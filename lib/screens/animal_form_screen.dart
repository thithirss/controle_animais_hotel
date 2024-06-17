import 'package:flutter/material.dart';
import 'package:controle_animais_hotel/models/animal.dart';

class AnimalFormScreen extends StatefulWidget {
  final Function(Animal) adicionarAnimal;

  const AnimalFormScreen({Key? key, required this.adicionarAnimal}) : super(key: key);

  @override
  _AnimalFormScreenState createState() => _AnimalFormScreenState();
}

class _AnimalFormScreenState extends State<AnimalFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nomeTutor = '';
  String _contatoTutor = '';
  String _especie = 'Cachorro';
  String _raca = '';
  DateTime? _dataEntrada;
  int? _diarias;
  DateTime? _previsaoSaida;
  int? _diariasTotais;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Animal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome do Tutor'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do tutor';
                    }
                    return null;
                  },
                  onSaved: (value) => _nomeTutor = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contato do Tutor'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o contato do tutor';
                    }
                    return null;
                  },
                  onSaved: (value) => _contatoTutor = value!,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Espécie'),
                  value: _especie,
                  items: ['Cachorro', 'Gato'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _especie = newValue!;
                    });
                  },
                  onSaved: (newValue) => _especie = newValue!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Raça'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a raça do animal';
                    }
                    return null;
                  },
                  onSaved: (value) => _raca = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Data de Entrada'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a data de entrada';
                    }
                    return null;
                  },
                  onSaved: (value) => _dataEntrada = DateTime.tryParse(value!),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Diárias'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a quantidade de diárias';
                    }
                    return null;
                  },
                  onSaved: (value) => _diarias = int.tryParse(value!),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Previsão de Saída'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a previsão de saída';
                    }
                    return null;
                  },
                  onSaved: (value) => _previsaoSaida = DateTime.tryParse(value!),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Diárias Totais'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a quantidade total de diárias';
                    }
                    return null;
                  },
                  onSaved: (value) => _diariasTotais = int.tryParse(value!),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Animal newAnimal = Animal(
                        nomeTutor: _nomeTutor,
                        contatoTutor: _contatoTutor,
                        especie: _especie,
                        raca: _raca,
                        dataEntrada: _dataEntrada ?? DateTime.now(),
                        diarias: _diarias ?? 0,
                        previsaoSaida: _previsaoSaida ?? DateTime.now(),
                        diariasTotais: _diariasTotais ?? 0,
                      );
                      widget.adicionarAnimal(newAnimal);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
