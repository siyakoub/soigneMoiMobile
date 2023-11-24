import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soigne_moi_mobile/interfaces/user/login.dart';
import 'package:soigne_moi_mobile/interfaces/user/userCreation.dart';
import 'package:soigne_moi_mobile/interfaces/user/userUpdate.dart';


class UserService {
  final String baseUrl = 'http://127.0.0.1:5000/api/user';

  Future<List<dynamic>> getAllUsers() async  {
    final response = await http.get(
      Uri.parse('/users'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun utilisateur trouvé...');
    } else {
      throw Exception("Une erreur est survenue lors de la récupération des utilisateurs...");
    }
  }

  Future<List<dynamic>> getAllUsersActif() async {
    final response = await http.get(
      Uri.parse('/users/actif'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun utilisateur trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération des utilisateur actif...');
    }
  }

  Future<List<dynamic>> getAllUsersInactif() async {
    final response = await http.get(
      Uri.parse('/users/inactif'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception("Aucun utilisateur inactif trouvé...");
    } else {
      throw Exception("Une erreur est survenue lors de la récupération des utilisateurs inactif...");
    }
  }

  Future<Map<String, dynamic>> getUserById(int idUser) async {
    final response = await http.get(
      Uri.parse('/users/$idUser'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun utilisateur trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération de l\'utilisateur...');
    }
  }

  Future<Map<String, dynamic>> getUserByEmail(String email) async {
    final response = await http.get(
      Uri.parse('/users/$email'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun utilisateur possèdant cette email trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération de l\'utilisateur...');
    }
  }

  Future<Map<String, dynamic>> getUserByToken(String token) async {
    final response = await http.get(
      Uri.parse('/users/getByToken'),
      headers: {
        'Content-Type': 'application/json',
        'token': token
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun utilisateur trouvé avec ce token...');
    } else {
      throw Exception('Une erreur est survenue lors de la récupération de l\'utilisateur...');
    }
  }

  Future<Map<String, dynamic>> createUser(UserCreation userCreation) async {
    final response = await http.post(
      Uri.parse('/users/signup'),
      body: json.encode(userCreation.toJson()),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 201) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Problème lors de l\'inscription du nouvel utilisateur...');
    } else {
      throw Exception('Une erreur est survenue lors de la création du nouvel utilisateur...');
    }
  }

  Future<Map<String, dynamic>> updateUser(UserUpdate userUpdate, String email) async {
    final response = await http.put(
      Uri.parse('/users/$email'),
      body: json.encode(userUpdate.toJson()),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Utilisateur introuvable...');
    } else {
      throw Exception('Une erreur est survenue lors de la mise à jour de l\'utilisateur...');
    }
  }

  Future<Map<String,dynamic>> desactivateUser(String email) async {
    final response = await http.put(
      Uri.parse('/users/$email/desactivate'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun utilisateur trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la désactivation de l\'utilisateur...');
    }
  }
  
  Future<Map<String, dynamic>> deleteUser(String email) async {
    final response = await http.delete(
      Uri.parse('/users/$email/delete'),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun utilisateur trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la suppression de l\'utilisateur...');
    }
  }

  Future<Map<String, dynamic>> loginUser(Login login) async {
    final response = await http.post(
      Uri.parse('/users/login'),
      body: json.encode(login.toJson()),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Aucun utilisateur trouvé...');
    } else {
      throw Exception('Une erreur est survenue lors de la connexion utilisateur...');
    }
  }

  Future<Map<String, dynamic>> logoutUser(String token) async {
    final response = await http.delete(
      Uri.parse('/users/logout'),
      headers: {
        'Content-Type': 'application/json',
        'token': token
      }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Le token n\'appartient à aucun utilisateur ou est expirée...');
    } else {
      throw Exception('Une erreur est survenue lors de la déconnexion de l\'utilisateur...');
    }
  }
}
