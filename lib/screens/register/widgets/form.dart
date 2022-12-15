import 'package:achilleservice/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:achilleservice/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Form(
        child: Column(
      children: [
        const SizedBox(height: 15),
        const TextForm(),
        const SizedBox(height: 15),
        const TextForm(),
        const SizedBox(height: 15),
        const TextForm(),
        const SizedBox(height: 40),
        CustomElevatedButton(
          color: AppTheme.colorScheme.secondary,
          backgroundColor: AppTheme.colorScheme.primary,
          label: Text(t.register,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
          onPressed: () {},
        ),
      ],
    ));
  }
}
