import 'package:dependencies/dependencies.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
  final String locationAreaEncounters;
  final bool isDefault;

  const Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.locationAreaEncounters,
    required this.isDefault,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        baseExperience,
        height,
        weight,
        locationAreaEncounters,
        isDefault,
      ];
}
