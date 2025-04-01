// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonStore on PokemonStoreBase, Store {
  late final _$pokemonListAtom =
      Atom(name: 'PokemonStoreBase.pokemonList', context: context);

  @override
  ObservableList<PokemonSummary> get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(ObservableList<PokemonSummary> value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'PokemonStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'PokemonStoreBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$offsetAtom =
      Atom(name: 'PokemonStoreBase.offset', context: context);

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  late final _$limitAtom =
      Atom(name: 'PokemonStoreBase.limit', context: context);

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  late final _$hasMoreAtom =
      Atom(name: 'PokemonStoreBase.hasMore', context: context);

  @override
  bool get hasMore {
    _$hasMoreAtom.reportRead();
    return super.hasMore;
  }

  @override
  set hasMore(bool value) {
    _$hasMoreAtom.reportWrite(value, super.hasMore, () {
      super.hasMore = value;
    });
  }

  late final _$fetchPokemonListAsyncAction =
      AsyncAction('PokemonStoreBase.fetchPokemonList', context: context);

  @override
  Future<void> fetchPokemonList() {
    return _$fetchPokemonListAsyncAction.run(() => super.fetchPokemonList());
  }

  late final _$refreshPokemonListAsyncAction =
      AsyncAction('PokemonStoreBase.refreshPokemonList', context: context);

  @override
  Future<void> refreshPokemonList() {
    return _$refreshPokemonListAsyncAction
        .run(() => super.refreshPokemonList());
  }

  @override
  String toString() {
    return '''
pokemonList: ${pokemonList},
isLoading: ${isLoading},
error: ${error},
offset: ${offset},
limit: ${limit},
hasMore: ${hasMore}
    ''';
  }
}
