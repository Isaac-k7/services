import 'package:achilleservice/blocs/bloc.dart';
import 'package:achilleservice/oberver.dart';
import 'package:achilleservice/repositories/repositories.dart';
import 'package:achilleservice/screens/screens.dart';
import 'package:achilleservice/services/api/api.dart';
import 'package:achilleservice/utils/timeago.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/theme/theme.dart';
import 'screens/welcome/cubit/config_cubit.dart';
import 'package:achilleservice/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await  initAppRequirements();
  runApp(const ServiceApp());
}

Future<void> initAppRequirements() async {
  await dotenv.load(fileName: "lib/env/.env");
  await clearSecureStorageOnReinstall();
  await initHive();
  initTimeago();
  Api.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> initHive() async {
  await Hive.initFlutter();
}

Future<void> clearSecureStorageOnReinstall() async {
  String key = 'hasRunBefore';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool(key) == null) {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.deleteAll();
    prefs.setBool(key, true);
  }
} 

class ServiceApp extends StatelessWidget {
  const ServiceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyRouter router = MyRouter();
    return MultiRepositoryProvider(
      providers: [
       
        RepositoryProvider<BaseAuthenticationRepository>(
          create: (context) => AuthenticationRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => ConfigCubit(),
          ),
          BlocProvider(
            create: (context) => AuthenticationBloc(
              context.read<BaseAuthenticationRepository>(),
            )..add(
                AuthenticationEventAppStarted(),
              ),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: ((context, theme) {
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              // locale: state.locale,
              // themeMode: state.themeMode,
              onGenerateRoute: router.getRoute,
              initialRoute: '/',
              debugShowCheckedModeBanner: false,
              theme: theme,
              home: const Welcome(),
            );
          }),
        ),
      ),
    );
  }
}
