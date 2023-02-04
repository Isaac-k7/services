import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../register/widgets/form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations? t = AppLocalizations.of(context)!;
    Size mediaSize = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: mediaSize.height * .3,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  t.createAnAccount,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    // fontFamily: 'Rubik',
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: mediaSize.height * .6,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FormRegister(),
            ),
          ),
        ),
      ],
    );
  }
}
