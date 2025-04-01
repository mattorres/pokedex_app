import 'package:app/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart' as mocktail;

class MockRepository extends mocktail.Mock implements IPokemonRepository {}

void main() {
  late MockRepository repository;
  late IGetAllPokemonUsecase usecase;

  setUp(() {
    repository = MockRepository();
    usecase = GetAllPokemonUsecase(repository);
  });

  test('deve retornar lista de pokémons com sucesso', () async {
    final list = [
      PokemonSummary(name: 'bulbasaur', url: ''),
      PokemonSummary(name: 'charmander', url: ''),
    ];

    mocktail
        .when(() => repository.getPaginatedPokemonList(offset: 0, limit: 20))
        .thenAnswer((_) async => Right(list));

    final result = await usecase.getPaginatedPokemonList(offset: 0, limit: 20);

    expect(result.isRight(), true);
  });

  test('deve retornar falha em caso de erro', () async {
    mocktail
        .when(() => repository.getPaginatedPokemonList(offset: 0, limit: 20))
        .thenAnswer((_) async => Left(PokemonServerError('Erro')));

    final result = await usecase.getPaginatedPokemonList(offset: 0, limit: 20);

    expect(result.isLeft(), true);
  });
}
