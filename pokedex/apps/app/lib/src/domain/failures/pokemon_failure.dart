import 'package:dependencies/dependencies.dart';

abstract class PokemonFailure extends Equatable {
  final String? message;

  const PokemonFailure([this.message]);

  @override
  List<Object?> get props => [message];
}

class PokemonNotFound extends PokemonFailure {
  const PokemonNotFound() : super('Pokémon not found');

  @override
  List<Object?> get props => [message];
}

class PokemonServerError extends PokemonFailure {
  const PokemonServerError([String? message])
      : super(message ?? 'Server error');

  @override
  List<Object?> get props => [message];
}
