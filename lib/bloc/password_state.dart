import 'package:equatable/equatable.dart';

class PasswordState extends Equatable {
  final String password;
  final bool copied;

  const PasswordState({this.password = "", this.copied = false});

  PasswordState copyWith({String? password, bool? copied}) {
    return PasswordState(
      password: password ?? this.password,
      copied: copied ?? this.copied,
    );
  }

  @override
  List<Object> get props => [password, copied];
}
