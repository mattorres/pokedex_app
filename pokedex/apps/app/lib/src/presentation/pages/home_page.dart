import 'package:dependencies/dependencies.dart';

import '../../domain/domain.dart';
import '../../src.dart' show getIt;
import '../presentation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonStore store = getIt<PokemonStore>();

  @override
  void initState() {
    store.fetchPokemonList();
    super.initState();
  }

  final Map<String, Color> typeColors = {
    'Grass': Colors.green.shade300,
    'Poison': Colors.purple.shade300,
    'Fire': Colors.orange.shade300,
    'Flying': Colors.blue.shade300,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text(
          'POKÉDEX',
          style: TextStyle(
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.teal.shade50,
        elevation: 0,
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading && store.pokemonList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (store.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(store.error!, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: store.refreshPokemonList,
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: store.refreshPokemonList,
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.8,
              ),
              itemCount: store.pokemonList.length + (store.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == store.pokemonList.length) {
                  store.fetchPokemonList();
                  return const Center(child: CircularProgressIndicator());
                }

                final pokemonSummary = store.pokemonList[index];
                return PokemonCard(
                  pokemon: pokemonSummary,
                  typeColors: typeColors,
                  store: store,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  final PokemonSummary pokemon;
  final Map<String, Color> typeColors;
  final PokemonStore store;

  const PokemonCard({
    required this.pokemon,
    required this.typeColors,
    required this.store,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        store.speakPokemonName(pokemon.name);
      },
      child: Card(
        color: Colors.pink.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                pokemon.url,
                height: 100,
                fit: BoxFit.contain,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.error, color: Colors.red),
              ),
              Text(
                pokemon.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
