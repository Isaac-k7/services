import 'package:achilleservice/blocs/bloc.dart';
import 'package:achilleservice/screens/settings/controller.dart';
import 'package:achilleservice/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final AppLocalizations t = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listenWhen: (previous, current) {
          return current is AuthenticationStateUnauthenticated;
        },
        listener: (context, state) {
          Controller.navigateToWelcome();
        },
        builder: (context, state) {
          if (state is AuthenticationStateAuthenticated) {
            return Center(
              child: CustomElevatedButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(
                        AuthenticationEventLoggedOut(),
                      );
                },
                label: Text(t.settingsLogoutCTA),
              ),
            );
          }
          return Center(
            child: CustomElevatedButton(
              onPressed: () {
                Controller.navigateToWelcome();
              },
              label: Text(t.login),
            ),
          );
        },
      ),
    );
  }
}
