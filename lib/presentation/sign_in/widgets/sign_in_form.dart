import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:utilapp/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utilapp/presentation/home_page/home_page.dart';
import 'package:utilapp/res/colors.dart';
import 'package:utilapp/presentation/maps/test.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Server error',
                  invalidEmailAndPasswordCombination: (_) =>
                      'Invalid email and password combination',
                ),
              ).show(context);
            },
            (success) {
              // TODO: Navigation to home page
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => HomePage()));
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidate: state.showErrorMessages,
          child: Column(
            children: [
              Expanded(
                flex: 45,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Image.asset(
                    'logo.png',
                  ),
                ),
              ),
              Expanded(
                flex: 55,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const Text(
                          'Sign in with your IRIS account',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              fillColor: LightColors.darkGrey,
                              hasFloatingPlaceholder: false,
                              filled: true,
                              labelStyle: TextStyle(color: Colors.white),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 0),
                              labelText: 'Roll No. / Email'),
                          cursorColor: Theme.of(context).primaryColor,
                          style: TextStyle(color: Colors.white),
                          autocorrect: false,
                          onChanged: (value) =>
                              context.bloc<SignInFormBloc>().add(
                                    SignInFormEvent.emailChanged(value),
                                  ),
                          validator: (_) => context
                              .bloc<SignInFormBloc>()
                              .state
                              .emailAddress
                              .value
                              .fold(
                                (f) => f.maybeMap(
                                  invalidEmail: (_) => 'Invalid Email',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              fillColor: LightColors.darkGrey,
                              hasFloatingPlaceholder: false,
                              labelStyle: TextStyle(color: Colors.white),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 0),
                              labelText: 'Password'),
                          cursorColor: Theme.of(context).primaryColor,
                          style: TextStyle(color: Colors.white),
                          autocorrect: false,
                          obscureText: true,
                          onChanged: (value) =>
                              context.bloc<SignInFormBloc>().add(
                                    SignInFormEvent.passwordChanged(value),
                                  ),
                          validator: (_) => context
                              .bloc<SignInFormBloc>()
                              .state
                              .password
                              .value
                              .fold(
                                (f) => f.maybeMap(
                                  shortPassword: (_) => 'Short Password',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                              // context.bloc<SignInFormBloc>().add(
                              //       const SignInFormEvent
                              //           .signInWithEmailAndPasswordPressed(),
                              //     );
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return LightColors.lightGrey;
                                  }
                                  return Theme.of(context).primaryColor;
                                },
                              ),
                            ),
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: LightColors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'or',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: LightColors.lightGrey,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: OutlineButton(
                            onPressed: () {
                              context.bloc<SignInFormBloc>().add(
                                    const SignInFormEvent
                                        .signInWithGooglePressed(),
                                  );
                            },
                            splashColor: Theme.of(context).accentColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(FontAwesomeIcons.google),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'continue as google guest',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
