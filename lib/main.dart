import 'dart:convert';
import "package:http/http.dart" as http;

void main() {
peliculas();
}
Future<void> peliculas() async {
  const apiKey = '9376dcb02b379b2d05b5f4e146249ed6'; 
  const apiUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  final respuestaservidor = await http.get(Uri.parse(apiUrl));
  int contador=0;
  if (respuestaservidor.statusCode == 200) {
    final dato = json.decode(respuestaservidor.body);

  if (dato['results'] != null) {
      final pelicula = dato['results'] as List<dynamic>;
  for (var peli in pelicula) {
    contador++;
    print('===================\n');
    print('PELICULA #'+ '$contador');
    print('===================\n');
        final nombre = peli['title'];
        final overview = peli['overview'];
        print('Nombre : $nombre');
        print('Resumen: $overview\n');
      }
} else {
  print('============================\n');
  print('No se encontraron resultados.');
  print('============================\n');
    }
} else {
  print('====================================================================================\n');
  print('Error al obtener datos de películas. Código de estado: ${respuestaservidor.statusCode}');
  print('====================================================================================\n');
}
}