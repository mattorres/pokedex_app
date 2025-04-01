import 'dart:convert';

import 'package:core/data/interfaces/http/http_client.dart';

import '../../models/response/response.dart';

abstract class IPokemonRemoteDataSource {
  Future<PokemonModel> getPokemonDetails({String name = ''});
  Future<PokemonListResponseModel> getPaginatedPokemonList({
    int offset = 0,
    int limit = 20,
  });
}

class PokemonRemoteDataSource implements IPokemonRemoteDataSource {
  final IHttpClient _httpClient;
  static const _path = 'pokemon';

  PokemonRemoteDataSource(this._httpClient);

  @override
  Future<PokemonListResponseModel> getPaginatedPokemonList({
    int offset = 0,
    int limit = 20,
  }) async {
    final response = await _httpClient.get(
      'https://pokeapi.co/api/v2/$_path',
      query: {'offset': offset, 'limit': limit},
    );
    final jsonData = jsonDecode(response.data as String);
    return PokemonListResponseModel.fromJson(jsonData);
  }

  @override
  Future<PokemonModel> getPokemonDetails({String name = ''}) {
    throw UnimplementedError();
  }
}
