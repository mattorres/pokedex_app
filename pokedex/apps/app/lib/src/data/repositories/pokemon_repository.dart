import 'package:dependencies/dependencies.dart';

import '../../domain/domain.dart';
import '../datasources/datasources.dart';

class PokemonRepository implements IPokemonRepository {
  final IPokemonRemoteDataSource _remoteDataSource;

  PokemonRepository(this._remoteDataSource);

  @override
  Future<Either<PokemonFailure, List<PokemonSummary>>> getPaginatedPokemonList({
    int offset = 0,
    int limit = 20,
  }) async {
    try {
      final response = await _remoteDataSource.getPaginatedPokemonList(
        offset: offset,
        limit: limit,
      );
      final summaries =
          response.results.map((model) => model.toEntity()).toList();
      return Right(summaries);
    } catch (e) {
      return Left(PokemonServerError(e.toString()));
    }
  }
}
