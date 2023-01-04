import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../login/widgets/form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations? t = AppLocalizations.of(context)!;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                t.login,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  // fontFamily: 'Rubik',
                ),
              ),
            ),
          ),
           const Expanded(
            flex: 4,
            child:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FormRegister(),
            ),
          ),
        ],
      ),
    );
  }
}
