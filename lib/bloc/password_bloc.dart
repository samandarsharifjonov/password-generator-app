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
    final strength = _evaluatePasswordStrength(password);
    emit(state.copyWith(password: password, copied: false, strength: strength));
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
  PasswordStrength _evaluatePasswordStrength(String password) {
    bool hasLetters = password.contains(RegExp(r'[a-zA-Z]'));
    bool hasNumbers = password.contains(RegExp(r'\d'));
    bool hasSpecial = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    if (password.length <= 6) {
      return PasswordStrength.weak;
    }

    if (password.length >= 12 && hasLetters && hasNumbers && hasSpecial) {
      return PasswordStrength.veryStrong;
    }

    if (password.length >= 10 && hasLetters && hasNumbers) {
      return PasswordStrength.strong;
    }

    if (password.length >= 8 && (hasLetters || hasNumbers)) {
      return PasswordStrength.medium;
    }

    return PasswordStrength.weak;
  }


}

