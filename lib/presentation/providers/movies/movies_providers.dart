import 'package:cinemapedia_220361/domain/entities/movie.dart';
import 'package:cinemapedia_220361/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

/// Provider que gestiona el estado de películas en cartelera usando Riverpod.
///
/// Proporciona una lista reactiva de películas que se actualiza automáticamente
/// cuando se cargan nuevas páginas, implementando paginación infinita.
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      /// Obtiene la función para cargar películas desde el repositorio
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

/// Definición del tipo de función para cargar películas
/// Recibe número de página y retorna lista de películas
typedef MovieCallback = Future<List<Movie>> Function({int page});

/// Notifier que maneja el estado y lógica de carga de películas.
class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  /// Carga la siguiente página de películas y las agrega al estado actual.
  ///
  /// **Funcionalidad:**
  /// - Incrementa contador de página
  /// - Obtiene nuevas películas de esa página
  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies]; // Spread operator para combinar listas
  }
}
