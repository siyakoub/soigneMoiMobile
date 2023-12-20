import 'package:flutter/material.dart';
import '../interfaces/user/login.dart';
import '../services/user_service.dart';
import 'homePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = ''; // Utiliser late pour une initialisation ultérieure
  String _password = '';
  String _userType = 'Client'; // Utiliser late pour une initialisation ultérieure

  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100,
              child: Image.asset(
                'assets/img/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24.0),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Mot de passe',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre mot de passe';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // setState est utilisé pour mettre à jour les valeurs
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    value: _userType,
                    items: <String>['Client', 'Administrateur', 'Médecin']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _userType = value ?? 'Client';
                      });
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Login loginData = Login(
                          email: _email,
                          password: _password,
                          userType: _userType,
                        );

                        try {
                          Map<String, dynamic> response =
                          await _userService.loginUser(loginData);

                          if (response['connected'] == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(userData: response),
                              ),
                            );
                          } else {
                            print("probleme");
                          }
                        } catch (e) {
                          print('Erreur de connexion: $e');
                        }
                      }
                    },
                    child: Text('Se connecter'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
