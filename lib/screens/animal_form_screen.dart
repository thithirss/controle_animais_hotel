import 'package:flutter/material.dart';
import 'package:controle_animais_hotel/models/animal.dart';
import 'package:intl/intl.dart';

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
  final TextEditingController _dataEntradaController = TextEditingController();
  final TextEditingController _previsaoSaidaController = TextEditingController();
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  

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

      _dataEntradaController.text =
          _dataEntrada != null ? dateFormat.format(_dataEntrada!) : '';
      _previsaoSaidaController.text =
          _previsaoSaida != null ? dateFormat.format(_previsaoSaida!) : '';
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

   Future<void> _selectDate(BuildContext context, TextEditingController controller, DateTime? initialDate, Function(DateTime?) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color.fromARGB(255, 78, 185, 6),
            colorScheme: ColorScheme.light(primary: Color.fromARGB(255, 78, 185, 6)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        onDateSelected(picked);
        controller.text = dateFormat.format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.animal == null ? 'Adicionar Animal' : 'Editar Animal',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 78, 185, 6),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  initialValue: _nomeTutor,
                  decoration: const InputDecoration(labelText: 'Nome do Tutor'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do tutor';
                    }
                    return null;
                  },
                  onSaved: (value) => _nomeTutor = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _contatoTutor,
                  decoration: const InputDecoration(labelText: 'Contato do Tutor'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o contato do tutor';
                    }
                    return null;
                  },
                  onSaved: (value) => _contatoTutor = value!,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Espécie'),
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
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _raca,
                  decoration: const InputDecoration(labelText: 'Raça'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a raça do animal';
                    }
                    return null;
                  },
                  onSaved: (value) => _raca = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _dataEntradaController,
                  decoration: const InputDecoration(labelText: 'Data de Entrada'),
                  readOnly: true,
                  onTap: () => _selectDate(context, _dataEntradaController, _dataEntrada, (date) => _dataEntrada = date),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a data de entrada';
                    }
                    return null;
                  },
                  onSaved: (value) => _dataEntrada = DateTime.tryParse(value!),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _diarias?.toString(),
                  decoration: const InputDecoration(labelText: 'Diárias'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a quantidade de diárias';
                    }
                    return null;
                  },
                  onSaved: (value) => _diarias = int.tryParse(value!),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _previsaoSaidaController,
                  decoration: const InputDecoration(labelText: 'Previsão de Saída'),
                  readOnly: true,
                  onTap: () => _selectDate(context, _previsaoSaidaController, _previsaoSaida, (date) => _previsaoSaida = date),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a previsão de saída';
                    }
                    return null;
                  },
                  onSaved: (value) => _previsaoSaida = DateTime.tryParse(value!),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _diariasTotais?.toString(),
                  decoration: const InputDecoration(labelText: 'Diárias Totais'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a quantidade de diárias totais';
                    }
                    return null;
                  },
                  onSaved: (value) => _diariasTotais = int.tryParse(value!),
                ),
                const SizedBox(height: 32),
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
                        previsaoSaida: _previsaoSaida ?? DateTime.now(),
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
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
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
