import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soigne_moi_mobile/interfaces/prescription/prescriptionCreation.dart';
import 'package:soigne_moi_mobile/services/prescription_service.dart';

class NewPrescriptionFormPage extends StatefulWidget {
  String medecinEmail;

  NewPrescriptionFormPage({super.key, required this.medecinEmail});

  @override
  _NewPrescriptionFormPageState createState() => _NewPrescriptionFormPageState();
}

class _NewPrescriptionFormPageState extends State<NewPrescriptionFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String userEmail, liste;
  DateTime? dateDebut;
  DateTime? dateFin;
  final PrescriptionService _prescriptionService = PrescriptionService();

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? dateDebut ?? DateTime.now() : dateFin ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != (isStartDate ? dateDebut : dateFin)) {
      setState(() {
        if (isStartDate) {
          dateDebut = picked;
        } else {
          dateFin = picked;
        }
      });
    }
  }

  void _createPrescription() async {
    try {
      String formattedDateDebut = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateDebut!);
      String formattedDateFin = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateFin!);
      PrescriptionCreation prescriptionCreation = PrescriptionCreation(
        medecin_email: widget.medecinEmail,
        user_email: userEmail,
        liste: liste,
        dateDebut: formattedDateDebut,
        dateFin: formattedDateFin,
      );
      await _prescriptionService.createPrescription(prescriptionCreation);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nouvelle Prescription ajoutée avec succès !')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle Prescription'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Entrez les informations suivantes : ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildTextFormField('Email du Patient', 'Veuillez entrer l\'email du patient'),
                const SizedBox(height: 20),
                _buildTextArea('Liste des Médicaments', 'Veuillez entrer la liste des médicaments'),
                const SizedBox(height: 20),
                _buildDateField('Date de Début', () => _selectDate(context, true)),
                const SizedBox(height: 20),
                _buildDateField('Date de Fin', () => _selectDate(context, false)),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _createPrescription();
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey,),
                    child: const Text('Soumettre', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, String errorText) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.blueGrey),
      ),
      onSaved: (value) {
        if (label == 'Email du Patient') {
          userEmail = value!;
        }
      },
      validator: (value) => value == null || value.isEmpty ? errorText : null,
    );
  }

  Widget _buildTextArea(String label, String errorText) {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.blueGrey),
      ),
      onSaved: (value) => liste = value!,
      validator: (value) => value == null || value.isEmpty ? errorText : null,
    );
  }

  Widget _buildDateField(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.calendar_today),
          ),
          controller: TextEditingController(
            text: label == 'Date de Début'
                ? dateDebut != null ? DateFormat('yyyy-MM-dd').format(dateDebut!) : ''
                : dateFin != null ? DateFormat('yyyy-MM-dd').format(dateFin!) : '',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez sélectionner une date';
            }
            return null;
          },
        ),
      ),
    );
  }
}
