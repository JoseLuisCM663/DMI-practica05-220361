import 'package:cinemapedia_220361/domain/repositories/movies_repository.dart';
import 'package:cinemapedia_220361/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_220361/domain/entities/movie.dart';

/// Implementación concreta del repositorio de películas.
///
/// Actúa como intermediario entre la capa de presentación y el datasource,
/// aplicando lógica de negocio si es necesaria antes de devolver los datos.
class MovieRepositoryImpl implements MoviesRepository {
  /// Datasource que se encarga del acceso real a los datos
  final MoviesDatasource datasource;

  /// Constructor que recibe el datasource por inyección de dependencias
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    /// Delega la operación al datasource
    /// Aquí se podría agregar lógica adicional como:
    /// - Validación de parámetros
    /// - Cache de resultados
    /// - Transformaciones de datos
    /// - Logging de operaciones
    return datasource.getNowPlaying(page: page);
  }
}
