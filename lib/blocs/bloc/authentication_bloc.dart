import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:achilleservice/models/user.dart';
import 'package:achilleservice/repositories/repositories.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationProvider _authenticationProvider;
  AuthenticationBloc(
    AuthenticationProvider authenticationProvider
  )
  :_authenticationProvider = authenticationProvider,
  super(AuthenticationStateUninitialized()) {
    on<AuthenticationEventAppStarted>(_appStarted);
    on<AuthenticationEventLoggedIn>(_loggedIn);
    on<AuthenticationEventLoggedOut>(_loggedOut);
    on<AuthenticationEventLoggedWithFacebook>(_loggedWithFacebook);
    on<AuthenticationEventLoggedWithApple>(_loggedWithApple);
    on<AuthenticationEventRegister>(_regiser);
  }

  _appStarted(even, Emitter<AuthenticationState> emit){}
  _loggedIn(even, Emitter<AuthenticationState> emit){}
  _loggedOut(even, Emitter<AuthenticationState> emit){}
  _loggedWithFacebook(even, Emitter<AuthenticationState> emit){}
  _loggedWithApple(even, Emitter<AuthenticationState> emit){}
  _regiser(even, Emitter<AuthenticationState> emit){
    _authenticationProvider.name;
  }
}
