import 'package:dependencies/dependencies.dart';

import '../domain.dart';

abstract class IPokemonRepository {
  Future<Either<PokemonFailure, List<Pokemon>>> getAll();
  Future<Either<PokemonFailure, List<PokemonSummary>>> getPaginatedPokemonList({
    int offset = 0,
    int limit = 20,
  });
  Future<Either<PokemonFailure, String>> getImagePokemon(String name);
}
