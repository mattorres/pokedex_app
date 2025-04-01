import 'package:dependencies/dependencies.dart';

import '../domain.dart';

abstract class IGetAllPokemonUsecase {
  Future<Either<PokemonFailure, List<PokemonSummary>>> getPaginatedPokemonList({
    int offset = 0,
    int limit = 20,
  });
  Future<Either<PokemonFailure, PokemonSummary>> getById(int id);
}

class GetAllPokemonUsecase implements IGetAllPokemonUsecase {
  final IPokemonRepository _repository;

  GetAllPokemonUsecase(this._repository);

  @override
  Future<Either<PokemonFailure, PokemonSummary>> getById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<PokemonFailure, List<PokemonSummary>>> getPaginatedPokemonList({
    int offset = 0,
    int limit = 20,
  }) async {
    return await _repository.getPaginatedPokemonList(
      offset: offset,
      limit: limit,
    );
  }
}
