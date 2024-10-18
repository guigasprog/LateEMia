import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../blocs/login/login_bloc.dart';
import '../blocs/login/login_event.dart';
import '../blocs/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  // Carrega as credenciais salvas ao iniciar o app
  _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');
    bool? rememberMe = prefs.getBool('rememberMe') ?? false;

    if (rememberMe) {
      setState(() {
        _usernameController.text = savedUsername ?? '';
        _passwordController.text = savedPassword ?? '';
        _rememberMe = true;
      });
    }
  }

  // Salva as credenciais quando o lembrete está ativado
  _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_rememberMe) {
      await prefs.setString('username', _usernameController.text);
      await prefs.setString('password', _passwordController.text);
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('username');
      await prefs.remove('password');
      await prefs.setBool('rememberMe', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
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
                  SizedBox(height: 100),
                  CircleAvatar(
                    radius: 50,
                    // Coloque sua logo aqui
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Usuário',
                      filled: true,
                      fillColor: Color(0xffffdaa1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      filled: true,
                      fillColor: Color(0xffffdaa1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                      Text('Lembre-me'),
                    ],
                  ),
                  SizedBox(height: 30),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Erro: ${state.error}'),
                          backgroundColor: Colors.red,
                        ));
                      } else if (state is LoginSuccess) {
                        // Navegue para outra tela em caso de sucesso
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return CircularProgressIndicator();
                      }

                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<LoginBloc>(context).add(
                            LoginButtonPressed(
                              username: _usernameController.text,
                              password: _passwordController.text,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 20),
                          backgroundColor: Color(0xffffa722),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Entrar',
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(color: Color(0xffffa722)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(color: Color(0xffffa722)),
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
