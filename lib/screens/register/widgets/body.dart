import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../register/widgets/form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations? t = AppLocalizations.of(context);
    return Column(
      children: [
        const SizedBox(height: 100),
        Center(
          child: Text(
            t!.createAnAccount,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              // fontFamily: 'Rubik',
            ),
          ),
        ),
        const SizedBox(height: 100,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FormRegister(),
        ),
      ],
    );
  }
}
