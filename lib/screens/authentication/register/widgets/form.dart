import 'package:achilleservice/blocs/bloc.dart';
import 'package:achilleservice/config/constants.dart';
import 'package:achilleservice/cubits/cubit/show_password_cubit.dart';
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
    TextEditingController phone = TextEditingController();
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController password = TextEditingController();

    return Form(
        key: _formKeyRegister,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
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
                          RegisterController.validateLastName(value, context),
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
                const SizedBox(height: 40),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, authState) {
                      return SizedBox(
                        child: BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, registerState) {
                            return CustomElevatedButton(
                              disabled: (registerState.phone == '' ||
                                  registerState.firstName == '' ||
                                  registerState.password == '' ||
                                  registerState.lastName == ''),
                              loading: authState is AuthenticationStateLoading,
                              color: AppTheme.colorScheme.secondary,
                              backgroundColor: AppTheme.colorScheme.primary,
                              label: Text(t.register,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                              onPressed: () {
                                if (_formKeyRegister.currentState!.validate()) {
                                  context.read<AuthenticationBloc>()
                                    .add(AuthenticationEventRegister(
                                        phone: registerState.phone ,
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
              ),
            ),
          ],
        ));
  }
}
