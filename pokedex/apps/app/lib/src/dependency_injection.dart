import 'package:core/data/data.dart';
import 'package:core/domain/domain.dart';
import 'package:core/infrastructure/infrastructure.dart';
import 'package:dependencies/dependencies.dart';
import 'package:dependencies/dependencies.dart' as http;

import 'data/data.dart';
import 'domain/domain.dart';
import 'presentation/presentation.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<http.Client>(http.Client());

  getIt.registerSingleton<ITtsService>(TtsServiceChannel());

  getIt.registerSingleton<IHttpClient>(
    HttpAdapter(client: getIt(), baseUrl: 'https://pokeapi.co/api/v2'),
  );

  getIt.registerSingleton<IPokemonRemoteDataSource>(
    PokemonRemoteDataSource(getIt()),
  );

  getIt.registerSingleton<IPokemonRepository>(PokemonRepository(getIt()));

  getIt.registerSingleton<IGetAllPokemonUsecase>(GetAllPokemonUsecase(getIt()));

  getIt.registerSingleton<PokemonStore>(PokemonStore(getIt(), getIt()));
}
