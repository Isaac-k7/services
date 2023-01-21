import 'package:achilleservice/blocs/bloc.dart';
import 'package:achilleservice/config/constants.dart';
import 'package:achilleservice/cubits/cubit/show_password_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:achilleservice/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controller.dart';
import '../cubit/register_cubit.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({Key? key}) : super(key: key);

  static final _formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
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
              Navigator.pushNamed(context, '/home');
        }
      },
      child: SingleChildScrollView(
        child: Form(
            key: _formKeyRegister,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 15),
                    TextForm(
                      controller: phone,
                      labelText: t.phone,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      icon: phone.text != '' ? null : Icons.close,
                      validator: (value) =>
                          RegisterController.validatePhone(value, context),
                      onChanged: (value) {
                        context.read<RegisterCubit>().changePhone(value);
                      },
                      onPressIcon: () {
                        phone.clear();
                        context.read<RegisterCubit>().changePhone('');
                      },
                    ),
                    const SizedBox(height: 15),
                    TextForm(
                      controller: email,
                      labelText: t.email,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.emailAddress,
                      icon: email.text != '' ? null : Icons.close,
                      validator: (value) =>
                          RegisterController.validateEmail(value, context),
                      onChanged: (value) {
                        context.read<RegisterCubit>().changeEmail(value);
                      },
                      onPressIcon: () {
                        email.clear();
                        context.read<RegisterCubit>().changeEmail('');
                      },
                    ),
                    const SizedBox(height: 15),
                    TextForm(
                      controller: firstName,
                      labelText: t.firstName,
                      textCapitalization: TextCapitalization.none,
                      icon: phone.text != '' ? null : Icons.close,
                      validator: (value) =>
                          RegisterController.validateFirstName(value, context),
                      onChanged: (value) {
                        context.read<RegisterCubit>().changeFistName(value);
                      },
                      onPressIcon: () {
                        firstName.clear();
                        context.read<RegisterCubit>().changeFistName('');
                      },
                    ),
                    const SizedBox(height: 15),
                    TextForm(
                      controller: lastName,
                      labelText: t.lastName,
                      textCapitalization: TextCapitalization.none,
                      icon: phone.text != '' ? null : Icons.close,
                      validator: (value) =>
                          RegisterController.validateLastName(value, context),
                      onChanged: (value) {
                        context.read<RegisterCubit>().changeLastName(value);
                      },
                      onPressIcon: () {
                        lastName.clear();
                        context.read<RegisterCubit>().changeLastName('');
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
                              RegisterController.validateLastName(
                                  value, context),
                          onChanged: (value) {
                            context.read<RegisterCubit>().changePassword(value);
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
                      child:
                          BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, authState) {
                          return SizedBox(
                            child: BlocBuilder<RegisterCubit, RegisterState>(
                              builder: (context, registerState) {
                                return CustomElevatedButton(
                                  disabled: (registerState.phone == '' ||
                                      registerState.email == '' ||
                                      registerState.firstName == '' ||
                                      registerState.password == '' ||
                                      registerState.lastName == ''),
                                  loading:
                                      authState is AuthenticationStateLoading,
                                  label: Text(t.register,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white)),
                                  onPressed: () {
                                    if (_formKeyRegister.currentState!
                                        .validate()) {
                                      context
                                          .read<AuthenticationBloc>()
                                          .add(AuthenticationEventRegister(
                                            email: registerState.email,
                                            username:
                                                '${registerState.firstName}${registerState.lastName}_${registerState.phone.substring(5, 7)}',
                                            phone: registerState.phone,
                                            firstName: registerState.firstName,
                                            lastName: registerState.lastName,
                                            password: registerState.password,
                                          ));
                                    }
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
