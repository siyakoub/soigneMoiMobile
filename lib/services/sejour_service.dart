import 'dart:convert';
import 'package:http/http.dart' as http;

class SejourService {
  final String baseUrl = 'https://api.soigne-moi-app.fr/api/medecin';

  Future<List<dynamic>> getAllSejour() async {
    final response = await http.get(
      Uri.parse('$baseUrl/sejours'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun sejour trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération des séjours...');
    }
  }

  Future<Map<String, dynamic>> getSejourById(int sejour_id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/sejours/$sejour_id'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200){
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun séjour trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération du séjour...');
    }
  }

  Future<Map<String, dynamic>> getAllSejoursByUser(int user_id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/sejours/$user_id/byuser'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun séjour trouvé...');
    } else {
      throw Exception('Une erreur est survenur lors de la récupération des séjours...');
    }
  }

  Future<Map<String, dynamic>> getAllSejoursByMedecin(int medecin_id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/sejours/$medecin_id/formedecin'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun séjour');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération des séjours...');
    }
  }
}