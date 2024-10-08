import 'package:flutter/material.dart';

void main() => runApp(LateMiaApp());

class LateMiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3), // Fundo neutro suave
      body: Stack(
        children: [
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 340,
              height: 340,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x50ffa050), // Esfera laranja mais escura
              ),
            ),
          ),
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffffa050), // Esfera laranja mais escura
              ),
            ),
          ),
          Positioned(
            top: -60,
            left: -40,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x76ffc060), // Esfera laranja vibrante
              ),
            ),
          ),
          Positioned(
            top: -45,
            left: -20,
            child: Container(
              width: 230,
              height: 230,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffffc060), // Esfera laranja vibrante
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100), // Espaço para as esferas
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/late_mia_logo.png'), // Coloque sua logo aqui
                  ),
                  SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Usuário',
                      filled: true,
                      fillColor: Color(
                          0xffffdaa1), // Amarelo mais vivo para instruir o uso
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      filled: true,
                      fillColor: Color(0xffffdaa1), // Mesmo tom para a senha
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Checkbox(value: true, onChanged: (value) {}),
                      Text('Lembre-me'),
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      backgroundColor: Color(
                          0xffffa722), // Laranja forte para o botão de ação
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Entrar',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFFFFFFF))),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(
                          color: Color(
                              0xffffa722)), // Vermelho claro para destaque
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(
                          color:
                              Color(0xffffa722)), // Mesma cor para consistência
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
