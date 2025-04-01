import 'response.dart';

class PokemonListResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonResultModel> results;

  PokemonListResponseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonListResponseModel.fromJson(Map<String, dynamic> json) {
    return PokemonListResponseModel(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results:
          (json['results'] as List<dynamic>)
              .map(
                (item) =>
                    PokemonResultModel.fromJson(item as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}
