import 'package:achilleservice/blocs/bloc.dart';
import 'package:achilleservice/config/constants.dart';
import 'package:achilleservice/cubits/cubit/show_password_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:achilleservice/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controller.dart';
import '../cubit/login_cubit.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({Key? key}) : super(key: key);

  static final _formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    TextEditingController userName = TextEditingController();
    TextEditingController password = TextEditingController();

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationStateUnauthenticated) {
          showGenericSnackbar(context,
              message: state.errorMessage ?? '',
              backgroundColor: CupertinoColors.destructiveRed);
        }
        if (state is AuthenticationStateAuthenticated) {
          showGenericSnackbar(context,
              message: t.userLogedInsuccessfully,
              backgroundColor: CupertinoColors.activeGreen);
        }
      },
      child: Form(
          key: _formKeyRegister,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  const SizedBox(height: 15),
                  TextForm(
                    controller: userName,
                    labelText: t.userName,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.number,
                    icon: userName.text != '' ? null : Icons.close,
                    validator: (value) =>
                        LoginController.validateUserName(value, context),
                    onChanged: (value) {
                      context.read<LoginCubit>().changeUserName(value);
                    },
                    onPressIcon: () {
                      userName.clear();
                    },
                  ),
                  const SizedBox(height: 15),
                  BlocBuilder<ShowPasswordCubit, bool>(
                    builder: (context, showPassword) {
                      return TextForm(
                        controller: password,
                        labelText: t.password,
                        textCapitalization: TextCapitalization.none,
                        obscureText: showPassword,
                        icon: showPassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.password,
                        validator: (value) =>
                            LoginController.validateLastName(value, context),
                        onChanged: (value) {
                          context.read<LoginCubit>().changePassword(value);
                        },
                        onPressIcon: () {
                          context
                              .read<ShowPasswordCubit>()
                              .togglePassword(showPassword);
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 0),
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, loginState) {
                        return SizedBox(
                          child: BlocListener<AuthenticationBloc,
                              AuthenticationState>(
                            listener: (context, state) {
                              if (state is AuthenticationStateAuthenticated) {
                                Navigator.pushNamed(context,'/home');
                              }
                            },
                            child: BlocBuilder<AuthenticationBloc,
                                AuthenticationState>(
                              builder: (context, authState) {
                                return CustomElevatedButton(
                                  // disabled:
                                  //     (loginState.phone == '' || loginState.password == ''),
                                  loading:
                                      authState is AuthenticationStateLoading,
                                  label: Text(t.login,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white)),
                                  onPressed: () {
                                    if (_formKeyRegister.currentState!
                                        .validate()) {
                                      context.read<AuthenticationBloc>().add(
                                          AuthenticationEventLoggedIn(
                                              userName: userName.text,
                                              password: password.text));
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
