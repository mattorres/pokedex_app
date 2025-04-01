import 'package:app/src/data/data.dart';
import 'package:core/data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'dart:convert';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late MockHttpClient client;
  late PokemonRemoteDataSource datasource;

  setUp(() {
    client = MockHttpClient();
    datasource = PokemonRemoteDataSource(client);
  });

  test('deve retornar lista de pokémons ao chamar a PokeAPI', () async {
    final responsePayload = {
      "results": [
        {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"},
        {"name": "charmander", "url": "https://pokeapi.co/api/v2/pokemon/4/"},
      ],
    };

    when(() => client.get(any())).thenAnswer(
      (_) async => HttpResponse(
        data: jsonEncode(responsePayload),
        status: HttpStatus.ok,
      ),
    );

    final result = await datasource.getPaginatedPokemonList(
      offset: 0,
      limit: 20,
    );

    expect(result.results.length, 2);
    expect(result.results.first.name, 'bulbasaur');
  });

  test('deve lançar exceção em status != 200', () async {
    when(() => client.get(any())).thenAnswer(
      (_) async => HttpResponse(data: '', status: HttpStatus.serverError),
    );

    expect(
      () async =>
          await datasource.getPaginatedPokemonList(offset: 0, limit: 20),
      throwsException,
    );
  });
}
