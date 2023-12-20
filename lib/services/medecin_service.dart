import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soigne_moi_mobile/interfaces/medecin/medecinCreation.dart';
import 'package:soigne_moi_mobile/interfaces/medecin/medecinUpdate.dart';

class MedecinService {
  final String baseUrl = 'https://api.soigne-moi-app.fr/api/medecin';

  Future<List<dynamic>> getAllMedecins() async {
    final response = await http.get(
      Uri.parse('$baseUrl/medecins'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun médecin trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération des médecins...');
    }
  }

  Future<List<dynamic>> getAllMedecinsActif() async {
    final response = await http.get(
      Uri.parse('$baseUrl/medecins/actif'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun médecin actif trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération des médecins...');
    }
  }

  Future<List<dynamic>> getAllMedecinsInactif() async {
    final response = await http.get(
      Uri.parse('$baseUrl/medecins/inactif'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun médecin inactif trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération médecins...');
    }
  }

  Future<Map<String, dynamic>> getMedecinById(int idMedecin) async {
    final response = await http.get(
      Uri.parse('$baseUrl/medecins/$idMedecin'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun médecin trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération de l\'utilisateur');
    }
  }
  
  Future<Map<String, dynamic>> getMedecinByUserId(int user_id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/medecins/$user_id/byUser'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun médecin trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération du médecin...');
    }
  }

  Future<Map<String, dynamic>> getMedecinByEmail(String email) async {
    final response = await http.get(
      Uri.parse('$baseUrl/medecins/$email'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun médecin trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération du médecin...');
    }
  }

  Future<Map<String, dynamic>> createMedecin(MedecinCreation medecinCreation) async {
    final response = await http.post(
      Uri.parse('$baseUrl/medecins/signup'),
      body: json.encode(medecinCreation.toJson()),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 201) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Problème lors de l\'inscription du médecin...');
    } else {
      throw Exception('Une erreur est survenue lors de la création du médecin...');
    }
  }

  Future<Map<String, dynamic>> updateMedecin(MedecinUpdate medecinUpdate, String email) async {
    final response = await http.put(
      Uri.parse('$baseUrl/medecins/$email'),
      body: json.encode(medecinUpdate.toJson()),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Problème survenue lors de la mise à jour du médecin...');
    } else {
      throw Exception('Une erreur est survenue lors de la mise à jour du médecin...');
    }
  }

  Future<Map<String, dynamic>> desactivateMedecin(String email) async {
    final response = await http.put(
      Uri.parse('$baseUrl/medecins/$email/desactivate'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun médecin trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la desactivation du médecin...');
    }
  }

  Future<Map<String, dynamic>> deleteMedecin(String email) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/medecins/$email/delete'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun médecin trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la suppression du médecin...');
    }
  }
}