import 'package:cinemapedia_220361/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia_220361/presentation/providers/providers.dart';
import 'package:cinemapedia_220361/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

/// Pantalla principal de la aplicación que muestra las películas en cartelera.
///
/// **Funcionalidades:**
/// - Lista de películas actualmente en cines
/// - Carga automática de datos al iniciar
/// - Interfaz simple con título y descripción
class HomeScreen extends StatelessWidget {
  /// Identificador único para navegación con GoRouter
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomButtomNavigationbar(),);
  }
}

/// Vista interna que maneja el estado y la lógica de la pantalla principal.
///
/// **Responsabilidades:**
/// - Cargar películas al inicializar la pantalla
/// - Escuchar cambios en el provider de películas
class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

/// Estado que gestiona el ciclo de vida y la construcción de la vista.
class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    /// Carga la primera página de películas al inicializar la pantalla
    /// Usa .read() porque es una acción única, no una escucha continua
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies=ref.watch(moviesSlideShowProvider);

    return Column(
      children: [
        CustomAppbar(),

        MovieSlidershow(movies: slideShowMovies),
        MovieHorizontalListview(movies:nowPlayingMovies,
        title: "En cines",
        subtitle: "miercoles,22 de octubre",
        loadNextPage:(){
          print('Evento');
        })
      ],
    );
  }
}
