import 'package:dependencies/dependencies.dart';

import '../domain.dart';

abstract class IGetImagePokemonUsecase {
  Future<Either<PokemonFailure, String>> getImagePokemon(String name);
}

class GetImagePokemonUsecase implements IGetImagePokemonUsecase {
  final IPokemonRepository _repository;

  GetImagePokemonUsecase(this._repository);

  @override
  Future<Either<PokemonFailure, String>> getImagePokemon(String name) async {
    return await _repository.getImagePokemon(name);
  }
}
