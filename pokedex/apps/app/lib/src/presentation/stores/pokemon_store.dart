import 'package:core/domain/domain.dart';
import 'package:mobx/mobx.dart';

import '../../domain/domain.dart';

part 'pokemon_store.g.dart';

class PokemonStore = PokemonStoreBase with _$PokemonStore;

abstract class PokemonStoreBase with Store {
  final IGetAllPokemonUsecase _getAllPokemonUsecase;
  final ITtsService _ttsService;

  PokemonStoreBase(this._getAllPokemonUsecase, this._ttsService);

  @observable
  ObservableList<PokemonSummary> pokemonList = ObservableList<PokemonSummary>();

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  int offset = 0;

  @observable
  int limit = 20;

  @observable
  bool hasMore = true;

  @action
  Future<void> fetchPokemonList() async {
    if (isLoading || !hasMore) return;

    try {
      isLoading = true;
      error = null;

      final result = await _getAllPokemonUsecase.getPaginatedPokemonList(
        offset: offset,
        limit: limit,
      );

      result.fold(
        (failure) {
          PokemonServerError(failure.message);
        },
        (list) {
          pokemonList.addAll(list);
          offset += limit;
          hasMore = list.length == limit;
        },
      );
    } catch (e) {
      error = 'Unexpected error: $e';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> refreshPokemonList() async {
    offset = 0;
    pokemonList.clear();
    hasMore = true;
    await fetchPokemonList();
  }

  @action
  Future<void> speakPokemonName(String name) async {
    try {
      await _ttsService.speak(name);
    } catch (e) {
      error = 'Error speaking the name: $e';
    }
  }
}
