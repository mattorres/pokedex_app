import '../../../domain/domain.dart';

class PokemonResultModel {
  final String name;
  final String url;

  PokemonResultModel({required this.name, required this.url});

  factory PokemonResultModel.fromJson(Map<String, dynamic> json) {
    final url = json['url'] as String;
    return PokemonResultModel(name: json['name'] as String, url: url);
  }

  PokemonSummary toEntity() => PokemonSummary(name: name, url: url);
}
