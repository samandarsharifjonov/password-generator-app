import 'package:equatable/equatable.dart';

enum PasswordStrength { weak, medium, strong, veryStrong }

class PasswordState extends Equatable {
  final String password;
  final bool copied;
  final PasswordStrength strength;

  const PasswordState({this.password = "", this.copied = false, this.strength = PasswordStrength.weak});

  PasswordState copyWith({String? password, bool? copied, PasswordStrength? strength}) {
    return PasswordState(
      password: password ?? this.password,
      copied: copied ?? this.copied,
      strength: strength ?? this.strength,
    );
  }

  @override
  List<Object> get props => [password, copied, strength];
}

