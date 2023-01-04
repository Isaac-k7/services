import 'package:equatable/equatable.dart';
import 'package:achilleservice/models/user.dart';
import 'package:achilleservice/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final BaseAuthenticationRepository _authenticationRepository;
  AuthenticationBloc(
    BaseAuthenticationRepository authenticationRepository
  )
  :_authenticationRepository = authenticationRepository,
  super(AuthenticationStateUninitialized()) {
    on<AuthenticationEventAppStarted>(_appStarted);
    on<AuthenticationEventLoggedIn>(_loggedIn);
    on<AuthenticationEventLoggedOut>(_loggedOut);
    on<AuthenticationEventLoggedWithFacebook>(_loggedWithFacebook);
    on<AuthenticationEventLoggedWithApple>(_loggedWithApple);
    on<AuthenticationEventRegister>(_regiser);
  }

  _appStarted(event, Emitter<AuthenticationState> emit){}

  _loggedIn(event, Emitter<AuthenticationState> emit)async{
    emit(
      const AuthenticationStateLoading(
        provider: AuthenticationProvider.service,
      ),
    );
    try {
      final String? logInError = await _authenticationRepository.logIn(
        event.phone,
      );
      if (logInError == null) {
        final User? user = await _authenticationRepository.getUser();
        if (user is User) {
          emit(AuthenticationStateAuthenticated(user));
          return;
        }
      }
      emit(AuthenticationStateUnauthenticated(errorMessage: logInError));
    } catch (e) {
      emit(const AuthenticationStateUnauthenticated());
    }
  }
  _loggedOut(even, Emitter<AuthenticationState> emit)async{
        emit(const AuthenticationStateLoading());
    await _authenticationRepository.logOut();
    emit(const AuthenticationStateUnauthenticated());
  }
  _loggedWithFacebook(event, Emitter<AuthenticationState> emit){}
  _loggedWithApple(event, Emitter<AuthenticationState> emit){}


  _regiser(event, Emitter<AuthenticationState> emit)async{
     emit(
      const AuthenticationStateLoading(
        provider: AuthenticationProvider.service,
      ),
    );

    try {
      final String? registerError = await _authenticationRepository.register(
        firstName: event.firstName,
        lastName: event.lastName,
        phone: event.phone,
        password: event.password,
      );
      
      if (registerError == null) {
        
        final User? user = await _authenticationRepository.getUser();
        if (user is User) {
          emit(AuthenticationStateAuthenticated(user));
          return;
        }
      }
      emit(AuthenticationStateUnauthenticated(errorMessage: registerError));
    } catch (e) {
      print(e);
      emit(const AuthenticationStateUnauthenticated());
    }
  }
}
