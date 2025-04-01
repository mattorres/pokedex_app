import '../../../domain/entities/pokemon.dart'; // Ajustado para o caminho correto

class PokemonModel {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
  final String locationAreaEncounters;
  final bool isDefault;

  PokemonModel({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.locationAreaEncounters,
    required this.isDefault,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      baseExperience: json['base_experience'] as int,
      height: json['height'] as int,
      weight: json['weight'] as int,
      locationAreaEncounters: json['location_area_encounters'] as String,
      isDefault: json['is_default'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'base_experience': baseExperience,
      'height': height,
      'weight': weight,
      'location_area_encounters': locationAreaEncounters,
      'is_default': isDefault,
    };
  }

  Pokemon toEntity() {
    return Pokemon(
      id: id,
      name: name,
      baseExperience: baseExperience,
      height: height,
      weight: weight,
      locationAreaEncounters: locationAreaEncounters,
      isDefault: isDefault,
    );
  }

  factory PokemonModel.fromEntity(Pokemon entity) {
    return PokemonModel(
      id: entity.id,
      name: entity.name,
      baseExperience: entity.baseExperience,
      height: entity.height,
      weight: entity.weight,
      locationAreaEncounters: entity.locationAreaEncounters,
      isDefault: entity.isDefault,
    );
  }
}
