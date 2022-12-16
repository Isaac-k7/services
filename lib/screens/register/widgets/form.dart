import 'package:achilleservice/config/constants.dart';
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
                  icon: phone.text!=''?null:Icons.close,
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
                  icon: phone.text!=''?null:Icons.close,
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
                  icon: phone.text!=''?null:Icons.close,
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
                const SizedBox(height: 40),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, register) {
                      return CustomElevatedButton(
                                      disabled: (register.phone=='' || register.firstName=='' || register.lastName==''),
                                      // loading: ,
                                      color: AppTheme.colorScheme.secondary, 
                                      backgroundColor: AppTheme.colorScheme.primary,
                                      label: Text(t.register,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700, color: Colors.white)),
                                      onPressed: () {
                                        if (_formKeyRegister.currentState!.validate()) {
                                        }
                                      },
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
