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
  String _userType = '';

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
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Login loginData = Login(
                          email: _email,
                          password: _password,
                          userType: 'Médecin'
                        );
                        try {
                          Map<String, dynamic> response =
                          await _userService.loginUser(loginData);

                          if (response['connected'] == true) {
                            if (response['medecin']['userType'] == 'Médecin'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(userData: response),
                                ),
                              );
                            } else {
                              print("Erreur : Ce compte n'est pas enregistré comme un compte médecin");
                            }
                          } else {
                            print("Un problème est survenue lors de la connexion de l'utilisateur...");
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
