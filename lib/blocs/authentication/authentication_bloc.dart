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

  Future<void> _appStarted(
    event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(AuthenticationStateLoading());
      if (await _authenticationRepository.isSignedIn()) {
        final User? user = await _authenticationRepository.getUser();
        if (user is User) {
          emit(AuthenticationStateAuthenticated(user));
          return;
        }
      }
      emit(const AuthenticationStateUnauthenticated());
    } catch (_) {
      emit(const AuthenticationStateUnauthenticated());
    }
  }

  _loggedIn(event, Emitter<AuthenticationState> emit)async{
    emit(
      AuthenticationStateLoading(),
    );
    try {

      final String? logInError = await _authenticationRepository.logIn(
        event.userName,
        event.password,
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
      emit(AuthenticationStateUnauthenticated(errorMessage: e.toString()));
    }
  }
  _loggedOut(even, Emitter<AuthenticationState> emit)async{
        emit( AuthenticationStateLoading());
    await _authenticationRepository.logOut();
    emit(const AuthenticationStateUnauthenticated());
  }
  _loggedWithFacebook(event, Emitter<AuthenticationState> emit){}
  _loggedWithApple(event, Emitter<AuthenticationState> emit){}


  _regiser(event, Emitter<AuthenticationState> emit)async{
     emit(
       AuthenticationStateLoading(),
    );

    try {
      final String? registerError = await _authenticationRepository.register(
        username: event.username,
        email: event.email,
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
      emit(AuthenticationStateUnauthenticated(errorMessage: e.toString()));
    }
  }
}
