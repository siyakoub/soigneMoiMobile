import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soigne_moi_mobile/interfaces/prescription/prescriptionCreation.dart';

class PrescriptionService {
  final String baseUrl = 'https://api.soigne-moi-app.fr/api/prescription';
  
  Future<List<dynamic>> getAllPrescription() async {
    final response = await http.get(
      Uri.parse('$baseUrl/prescriptions/getAll'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucune prescription trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération des prescriptions');
    }
  }

  Future<List<dynamic>> getAllPrescriptionByMedecin(String medecin_id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/prescriptions/$medecin_id/bymedecin'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucune Précription trouvé pour ce médecin...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération des prescription du médecin');
    }
  }

  Future<Map<String, dynamic>> getPrescriptionById(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/prescriptions/$id'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucune prescription avec cette id trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération de la prescription...');
    }
  }

  Future<Map<String, dynamic>> createPrescription(PrescriptionCreation prescriptionCreation) async {
    final response = await http.post(
      Uri.parse('$baseUrl/prescription/new'),
      body: jsonEncode(prescriptionCreation.toJson()),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Prescription invalide...');
    } else {
      throw Exception('Une erreur est survenue lors de l\'enregistrement de la nouvelle prescription...');
    }
  }
  
}