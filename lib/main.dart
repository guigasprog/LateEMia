import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './domain/usecases/login_usecase.dart';
import './presentation/blocs/login/login_bloc.dart';
import './presentation/pages/login_screen.dart';

void main() {
  runApp(LateMiaApp());
}

class LateMiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) =>
              LoginBloc(LoginUseCase()), // Use o LoginUseCase correto aqui
        ),
      ],
      child: MaterialApp(
        title: 'Late Mia App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
