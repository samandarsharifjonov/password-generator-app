import 'package:equatable/equatable.dart';

abstract class PasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GeneratePassword extends PasswordEvent {
  final int length;
  final bool includeNumbers;
  final bool includeSpecialChars;

  GeneratePassword({
    required this.length,
    required this.includeNumbers,
    required this.includeSpecialChars,
  });

  @override
  List<Object> get props => [length, includeNumbers, includeSpecialChars];
}
