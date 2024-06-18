import 'package:flutter/material.dart';
import 'package:controle_animais_hotel/models/animal.dart';

class AnimalFormScreen extends StatefulWidget {
  final Function(Animal) adicionarAnimal;
  final Function(Animal) editarAnimal;
  final Animal? animal;

  const AnimalFormScreen({
    Key? key,
    required this.adicionarAnimal,
    required this.editarAnimal,
    this.animal,
  }) : super(key: key);

  @override
  _AnimalFormScreenState createState() => _AnimalFormScreenState();
}

class _AnimalFormScreenState extends State<AnimalFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _nomeTutor;
  late String _contatoTutor;
  late String _especie;
  late String _raca;
  DateTime? _dataEntrada;
  int? _diarias;
  DateTime? _previsaoSaida;
  int? _diariasTotais;

  @override
  void initState() {
    super.initState();
    if (widget.animal != null) {
      _nomeTutor = widget.animal!.nomeTutor;
      _contatoTutor = widget.animal!.contatoTutor;
      _especie = widget.animal!.especie;
      _raca = widget.animal!.raca;
      _dataEntrada = widget.animal!.dataEntrada;
      _diarias = widget.animal!.diarias;
      _previsaoSaida = widget.animal!.previsaoSaida;
      _diariasTotais = widget.animal!.diariasTotais;
    } else {
      _nomeTutor = '';
      _contatoTutor = '';
      _especie = 'Cachorro';
      _raca = '';
      _dataEntrada = null;
      _diarias = null;
      _previsaoSaida = null;
      _diariasTotais = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.animal == null ? 'Adicionar Animal' : 'Editar Animal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adicione const aqui
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  initialValue: _nomeTutor,
                  decoration: const InputDecoration(labelText: 'Nome do Tutor'), // Adicione const aqui
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do tutor';
                    }
                    return null;
                  },
                  onSaved: (value) => _nomeTutor = value!,
                ),
                TextFormField(
                  initialValue: _contatoTutor,
                  decoration: const InputDecoration(labelText: 'Contato do Tutor'), // Adicione const aqui
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o contato do tutor';
                    }
                    return null;
                  },
                  onSaved: (value) => _contatoTutor = value!,
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Espécie'), // Adicione const aqui
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
                  initialValue: _raca,
                  decoration: const InputDecoration(labelText: 'Raça'), // Adicione const aqui
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a raça do animal';
                    }
                    return null;
                  },
                  onSaved: (value) => _raca = value!,
                ),
                TextFormField(
                  initialValue: _dataEntrada?.toString(),
                  decoration: const InputDecoration(labelText: 'Data de Entrada'), // Adicione const aqui
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a data de entrada';
                    }
                    return null;
                  },
                  onSaved: (value) => _dataEntrada = DateTime.tryParse(value!),
                ),
                TextFormField(
                  initialValue: _diarias?.toString(),
                  decoration: const InputDecoration(labelText: 'Diárias'), // Adicione const aqui
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
                  initialValue: _previsaoSaida?.toString(),
                  decoration: const InputDecoration(labelText: 'Previsão de Saída'), // Adicione const aqui
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a previsão de saída';
                    }
                    return null;
                  },
                  onSaved: (value) => _previsaoSaida = DateTime.tryParse(value!),
                ),
                TextFormField(
                  initialValue: _diariasTotais?.toString(),
                  decoration: const InputDecoration(labelText: 'Diárias Totais'), // Adicione const aqui
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a quantidade de diárias totais';
                    }
                    return null;
                  },
                  onSaved: (value) => _diariasTotais = int.tryParse(value!),
                ),
                const SizedBox(height: 20), // Adicione const aqui
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final id = widget.animal?.id ?? UniqueKey().toString();
                      final novoAnimal = Animal(
                        id: id,
                        nomeTutor: _nomeTutor,
                        contatoTutor: _contatoTutor,
                        especie: _especie,
                        raca: _raca,
                        dataEntrada: _dataEntrada ?? DateTime.now(),
                        diarias: _diarias!,
                        previsaoSaida: _previsaoSaida?? DateTime.now(),
                        diariasTotais: _diariasTotais!,
                      );
                      if (widget.animal == null) {
                        widget.adicionarAnimal(novoAnimal);
                      } else {
                        widget.editarAnimal(novoAnimal);
                      }
                      Navigator.pop(context);
                    }
                  },
                  child: Text(widget.animal == null ? 'Adicionar' : 'Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
