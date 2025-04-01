import 'package:app/src/domain/domain.dart';
import 'package:app/src/presentation/stores/stores.dart';
import 'package:core/domain/domain.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart' as mocktail;

class MockGetAllPokemonUsecase extends mocktail.Mock
    implements IGetAllPokemonUsecase {}

class MockTTSService extends mocktail.Mock implements ITtsService {}

void main() {
  late PokemonStore store;
  late MockGetAllPokemonUsecase usecase;
  late MockTTSService mockTTSService;

  setUp(() {
    usecase = MockGetAllPokemonUsecase();
    mockTTSService = MockTTSService();
    store = PokemonStore(usecase, mockTTSService);
  });

  test('deve popular pokémons com sucesso', () async {
    final pokemons = [
      PokemonSummary(name: 'Bulbasaur', url: ''),
      PokemonSummary(name: 'Charmander', url: ''),
    ];

    mocktail
        .when(() => usecase.getPaginatedPokemonList(offset: 0, limit: 20))
        .thenAnswer((_) async => Right(pokemons));

    await store.fetchPokemonList();

    expect(store.pokemonList.length, equals(2));
    expect(store.error, isNull);
    expect(store.pokemonList.first.name, equals('Bulbasaur'));
  });

  test('deve preencher erro em caso de falha', () async {
    final failure = PokemonServerError('Falha na API');

    mocktail
        .when(() => usecase.getPaginatedPokemonList(offset: 0, limit: 20))
        .thenAnswer((_) async => Left(failure));

    await store.fetchPokemonList();

    expect(store.pokemonList.isEmpty, true);
    expect(store.error, equals('Falha na API'));
  });
}
