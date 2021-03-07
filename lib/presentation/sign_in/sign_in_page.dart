import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:utilapp/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:utilapp/domain/auth/i_auth_facade.dart';
import 'package:utilapp/infrastructure/auth/firebase_auth_facade.dart';
import 'package:utilapp/presentation/sign_in/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IAuthFacade _iAuthFacade =
        new FirebaseAuthFacade(FirebaseAuth.instance, GoogleSignIn());
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignInFormBloc(_iAuthFacade),
        child: SignInForm(),
      ),
    );
  }
}
