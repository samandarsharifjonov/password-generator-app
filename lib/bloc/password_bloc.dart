import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'password_event.dart';
import 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(const PasswordState()) {
    on<GeneratePassword>(_onGeneratePassword);
  }

  void _onGeneratePassword(GeneratePassword event, Emitter<PasswordState> emit) {
    final password = _generatePassword(event.length, event.includeNumbers, event.includeSpecialChars);
    emit(state.copyWith(password: password, copied: false));
  }

  String _generatePassword(int length, bool includeNumbers, bool includeSpecialChars) {
    const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const numbers = "0123456789";
    const specialChars = "!@#\$%^&*()_-+=<>?/";

    String chars = letters;
    if (includeNumbers) chars += numbers;
    if (includeSpecialChars) chars += specialChars;

    return List.generate(length, (index) => chars[Random().nextInt(chars.length)]).join();
  }
}
